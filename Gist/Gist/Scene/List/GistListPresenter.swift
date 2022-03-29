//
//  GistListPresenter.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//

import Foundation

protocol GistListPresentationLogic {
  func presentResponse(_ response: GistListModel.Response)
}

final class GistListPresenter {
  private weak var viewController: GistListDisplayLogic?
  
  init(viewController: GistListDisplayLogic?) {
    self.viewController = viewController
  }
}

// MARK: - GistListPresentationLogic
extension GistListPresenter: GistListPresentationLogic {
  func presentResponse(_ response: GistListModel.Response) {
    switch response {
    case .createModels(list: let list):
      presentGistList(gistList: list)
    case .error(isConnection: let isConnection):
      ()
    case .empty:
      ()
    case .loading:
      ()
    }
  }
}


// MARK: - Private Zone
private extension GistListPresenter {
  func presentGistList(gistList: [GistResponse]) {
    let models = gistList.map {
      GistTableViewCell.Model(
        userName: $0.owner?.login ?? "Unamed",
        urlImage: $0.owner?.avatarUrl,
        fileType: $0.files?.first?.value.type ?? "Unknown")
    }
    viewController?.displayViewModel(.updateView(models))
  }
  
}
