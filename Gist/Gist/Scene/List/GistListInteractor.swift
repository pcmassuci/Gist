//
//  GistListInteractor.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//


import Foundation

protocol GistListBusinessLogic {
  func doRequest(_ request: GistListModel.Request)
}

final class GistListInteractor {
  private let service: GistListServiceProtocol
  private let presenter: GistListPresentationLogic
  private var page: Int = -1
  private var items: [GistResponse] = []

  init(presenter: GistListPresentationLogic, service: GistListServiceProtocol = GistListService()) {
    self.presenter = presenter
    self.service = service
  }
}

// MARK: - GistListBusinessLogic
extension GistListInteractor: GistListBusinessLogic {
  func doRequest(_ request: GistListModel.Request) {
    DispatchQueue.global(qos: .userInitiated).async {
      switch request {
      case .showList:
        self.requestItems()
      case .search(name: let name):
        self.search(name)
      case .displayDetail(item: let item):
        ()
      case .loading:
        self.presentLoadingStates()
      }
    }
  }
}

// MARK: - Private Zone
private extension GistListInteractor {
  func requestItems() {
    page += 1
    let query = GistRequestQuery(
      page: page,
      perPage: 30)

    service.gistRequest(requestHeader: query) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let list):
        self.present(list)
      case .failure(let error):
        self.presenterError(error)
      }
    }
  }

  func search(_ text: String) {
    let filterItems = items.filter { $0.owner?.login == text }
    presenter.presentResponse(.createModels(list: filterItems))
  }

  func present(_ list: [GistResponse]) {
    items.append(contentsOf: list)

    if items.isEmpty {
      presenter.presentResponse(.empty)
      return
    }

    presenter.presentResponse(.createModels(list: items))
  }

  func presenterError(_ serviceError: ServiceError) {
    switch serviceError {
    case .noConnection:
      presenter.presentResponse(.error(isConnection: false))
    default:
      presenter.presentResponse(.error(isConnection: true))
    }
  }

  func presentLoadingStates() {
    presenter.presentResponse(.loading)
  }
}
