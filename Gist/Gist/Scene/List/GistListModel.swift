//
//  GistListModel.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//

import Foundation

enum GistListModel {
  enum Request {
    case loading
    case showList
    case search(name: String)
    case displayDetail(item: Int)
  }

  enum Response {
    case createModels(list: [GistResponse])
    case error(isConnection: Bool)
    case empty
    case loading
  }
  enum ViewModel {
    case updateView([GistTableViewCell.Model])
    case erroView(isConnection: Bool)
    case emptyView
    case loadingView
  }

  enum Route {
    case openDetail
  }

  struct DataSource {
  }
}
