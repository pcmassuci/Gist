//
//  GistListRouterTests.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 28/03/22.
//

import XCTest
@testable import Gist


final class GistListRouterTests: XCTestCase {
  
  private var router: GistListRouter!
  private var viewController: GistListViewControllerSpy!

  override func setUp() {
    viewController = GistListViewControllerSpy()
    router = GistListRouter(viewController: viewController)
  }

  override func tearDown() {
    viewController = nil
    router = nil
  }
}


// MARK: - Tests
extension GistListRouterTests {

  func textExample() {
  }
}


// MARK: - Spy Classes Setup
private extension GistListRouterTests {

  final class GistListViewControllerSpy: UIViewController {
    var dismissExpectation: XCTestExpectation!
    var isDismissed: Bool = false

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
      isDismissed = true
      dismissExpectation.fulfill()
    }
  }
}
