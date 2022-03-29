//
//  Endpoint.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

import Foundation

struct Endpoint {
  enum Path: String {
    case list = "/gists/public"
  }
  
  let path: String
  let queryItems: [URLQueryItem]
  
  init(path: Path, queryItemsEncodable: Encodable) {
    self.path = path.rawValue
    queryItems = queryItemsEncodable.queryParams ?? []
  }
}

extension Endpoint {
  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.github.com"
    components.path = path
    components.queryItems = queryItems
    
    return components.url
  }
}
