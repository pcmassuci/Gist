//
//  GistListViewController.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 25/03/22.
//

import UIKit

protocol GistListDisplayLogic where Self: UIViewController {
  
  func displayViewModel(_ viewModel: GistListModel.ViewModel)
}

final class GistListViewController: UIViewController {
  private var interactor: GistListBusinessLogic?
  private var router: GistListRouting?
  private var dataSource: [GistTableViewCell.Model] = []
  private var searchView: SearchView? {
    view as? SearchView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Gist List"
    searchView?.setupSearchBar(delegate: self)
    searchView?.setupTableView(
      dataSource: self,
      delegate: self)
    
    interactor?.doRequest(GistListModel.Request.showList)
  }
  
  override func loadView() {
    view = SearchView()
  }
  
  func setup(interactor: GistListBusinessLogic?, router: GistListRouting?) {
    self.interactor = interactor
    self.router = router
  }
}


// MARK: - GistListDisplayLogic
extension GistListViewController: GistListDisplayLogic {
  func displayViewModel(_ viewModel: GistListModel.ViewModel) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      switch viewModel {
      case .updateView(let items):
        self.updateList(items)
      case .erroView:
        self.displayEmptyList()
      case .emptyView:
        self.displayEmptyList()
      case .loadingView:
        ()
      }
    }
  }
}

// MARK: - Private Zone
private extension GistListViewController {
  func updateList(_ items: [GistTableViewCell.Model]) {
    dataSource = items
    searchView?.tableViewUpdate()
  }
  
  func displayEmptyList() {
    
  }
  
  func displayErroScreen() {
    
  }
}

extension GistListViewController: UITableViewDelegate {
  
}

extension GistListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if dataSource.isEmpty || dataSource.count <= indexPath.item {
      return UITableViewCell()
    }
    
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: GistTableViewCell.identifier,
      for: indexPath) as? GistTableViewCell else {
      return UITableViewCell()
    }
    
    cell.model = dataSource[indexPath.row]
    cell.sizeToFit()
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row == (dataSource.count - 1) {
      interactor?.doRequest(.showList)
    }
  }
}

extension GistListViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let text = searchBar.text else { return }
    interactor?.doRequest(.search(name: text))
    searchBar.endEditing(true)
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = String()
    searchBar.endEditing(true)
  }

  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.setShowsCancelButton(true, animated: true)
  }

  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchBar.setShowsCancelButton(false, animated: true)
  }
}
