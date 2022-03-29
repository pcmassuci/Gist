//
//  GistListRouter.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//


import UIKit

protocol GistListRouting {
  func routeTo(_ route: GistListModel.Route)
}

final class GistListRouter {

  private weak var viewController: UIViewController?

  init(viewController: UIViewController?) {
    self.viewController = viewController
  }
}

// MARK: - GistListRouting
extension GistListRouter: GistListRouting {

  func routeTo(_ route: GistListModel.Route) {
    DispatchQueue.main.async {
      switch route {
      case .openDetail:
      ()
      }
    }
  }
}

// MARK: - Private Zone
private extension GistListRouter {
  
  func dismissGistListScene() {
    viewController?.dismiss(animated: true)
  }
  
  func showXSceneBy(_ data: Int) {
    print("will show the next screen")
  }
}
