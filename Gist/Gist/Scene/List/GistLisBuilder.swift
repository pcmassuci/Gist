//
//  GistLisBuilder.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//

import Foundation

enum GistLisBuilder {
  static func createListView() -> GistListViewController {
    let viewController = GistListViewController()
    let presenter = GistListPresenter(viewController: viewController)
    let interactor = GistListInteractor(presenter: presenter)
    let router = GistListRouter(viewController: viewController)
    viewController.setup(
      interactor: interactor,
      router: router)
    return viewController
  }
}
