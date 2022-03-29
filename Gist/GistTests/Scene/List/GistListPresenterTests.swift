//
//  GistListPresenterTests.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 28/03/22.
//


import XCTest
@testable import Gist


final class GistListPresenterTests: XCTestCase {
  
  private var presenter: GistListPresenter!
  private var viewController: GistListViewControllerSpy!
  
  override func setUp() {
    viewController = GistListViewControllerSpy()
    presenter = GistListPresenter(viewController: viewController)
  }
  
  override func tearDown() {
    viewController = nil
    presenter = nil
  }
}


// MARK: - Tests
extension GistListPresenterTests {
  
  func testExample() {
  }
}



// MARK: - Spy Classes Setup
private extension GistListPresenterTests {
  
  final class GistListViewControllerSpy: UIViewController, GistListDisplayLogic {
    
    func displayViewModel(_ viewModel: GistListModel.ViewModel) {
      
      #warning("handle viewModels")
    }
  }
}
