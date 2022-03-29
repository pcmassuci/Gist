////
////  GistListViewControllerTests.swift
////  Gist
////
////  Created by Paulo Cesar Morandi Massuci on 28/03/22.
////
//
//import XCTest
//@testable import Gist
//
//
//final class GistListViewControllerTests: XCTestCase {
//  
//  private var interactor: GistListInteractorSpy!
//  private var viewController: GistListViewController!
//  private var router: GistListRouterSpy!
//  
//  override func setUp() {
//    viewController = GistListViewController(
//      factory: self,
//      mainView: GistListView(),
//      dataSource: GistListModel.DataSource())
//  }
//  
//  override func tearDown() {
//    interactor = nil
//    viewController = nil
//    router = nil
//  }
//}
//
//
//
//// MARK: - Tests
//extension GistListViewControllerTests {
//  
//  func testExample() {
//  }
//}
//
//
//// MARK: - LoginFactorable, Injector
//extension GistListViewControllerTests: GistListFactorable {
//  
//  func makeInteractor(factory: InteractableFactory,
//                      viewController: GistListDisplayLogic?,
//                      dataSource: GistListModel.DataSource) -> GistListInteractable {
//    interactor = GistListInteractorSpy(dataSource: dataSource)
//    return interactor
//  }
//  
//  func makeRouter(viewController: UIViewController?) -> GistListRouting {
//    router = GistListRouterSpy()
//    return router
//  }
//}
//
//
//// MARK: - Spy Classes Setup
//private extension GistListViewControllerTests {
//  
//  final class GistListInteractorSpy: GistListInteractable {
//    var dataSource: GistListModel.DataSource
//    
//    init(dataSource: GistListModel.DataSource) {
//      self.dataSource = dataSource
//    }
//    
//    func doRequest(_ request: GistListModel.Request) {
//      
//#warning("handler requests")
//    }
//  }
//  
//  final class GistListRouterSpy: GistListRouting {
//    
//    func routeTo(_ route: GistListModel.Route) {
//      
//#warning("handle routes")
//    }
//  }
//}
