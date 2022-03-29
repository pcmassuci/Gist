//
//  GistService.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

import Foundation

typealias GistListPaginationCompletion = (Result<[GistResponse], ServiceError>) -> Void

protocol GistListServiceProtocol {
  
  func gistRequest(requestHeader: GistRequestQuery, completion: @escaping GistListPaginationCompletion) 
}

final class GistListService {
  private let session: URLSession

  init(session: URLSession = URLSession.shared) {
    self.session = session
  }
}

extension GistListService: GistListServiceProtocol {

  func gistRequest(requestHeader: GistRequestQuery, completion: @escaping GistListPaginationCompletion) {
    let endpoint = Endpoint(path: .list,
                            queryItemsEncodable: requestHeader)

    guard let url = endpoint.url else {
      completion(.failure(.emptyAPI))
      return
    }

    let task = session.dataTask(with: url) { [weak self] (data, response, error) in

      if let error = error {
        completion(.failure(.decodeError(error as NSError)))
        return
      }

      guard let jsonData = data else {
        completion(.failure(.wrongData))
        return
      }

      do {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode([GistResponse].self, from: jsonData)
        completion(.success(decoded))
      } catch let error {
        completion(.failure(.decodeError(error as NSError)))
      }
    }
    
    task.resume()
  }
}
