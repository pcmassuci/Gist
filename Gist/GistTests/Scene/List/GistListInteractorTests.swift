//
//  GistListInteractorTests.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 28/03/22.
//

import XCTest
@testable import Gist

final class GistListInteractorTests: XCTestCase {

  private var presenter: GistListPresenterSpy?
  private var interactor: GistListInteractor?
  private var service: GistListServiceDouble?
  
  
  override func setUp() {
    service = GistListServiceDouble()
    presenter = GistListPresenterSpy()
    interactor = GistListInteractor(
      presenter: presenter!,
      service: service!)
  }

//  override func tearDown() {
//    presenter = nil
//    interactor = nil
//    service = nil
//  }
}


// MARK: - Tests
extension GistListInteractorTests {
  func testNoInternetConnection() {
    // given
    service?.requestType = .noInternet
    
    // when
    interactor?.doRequest(.showList)

    // then
    switch presenter?.response {
    case .error(isConnection: let isConnection):
      XCTAssertFalse(isConnection)
    default:
      XCTFail()
    }
  }

//  func testErrorResponse() {
//    // given
//    service?.requestType = .error
//    
//    // when
//    interactor?.doRequest(.showList)
//
//    // then
//    switch presenter?.response {
//    case .error(isConnection: let isConnection):
//      XCTAssert(isConnection)
//    default:
//      XCTFail()
//    }
//  }
//  
//  func testLoading() {
//    // given
//    service?.requestType = .noInternet
//    
//    // when
//    interactor?.doRequest(.loading)
//    
//    // then
//    switch presenter?.response {
//    case .loading:
//      ()
//    default:
//      XCTFail()
//    }
//  }
//  
//  func testEmptyResponse() {
//    //given
//    service?.requestType = .empty
//    
//    //when
//    interactor?.doRequest(.showList)
//    
//    switch presenter?.response {
//    case .empty:
//      ()
//    default:
//      XCTFail()
//    }
//  }
//  
//  func testResponseWithValues()  {
//    //given
//    service?.requestType = .value
//    
//    //when
//    interactor?.doRequest(.showList)
//
//    //then
//    switch presenter?.response {
//    case .createModels(list: _):
//      ()
//    default:
//      XCTFail()
//    }
//  }
}


// MARK: - Spy Classes Setup
private extension GistListInteractorTests {
  final class GistListPresenterSpy: GistListPresentationLogic {
    var response: GistListModel.Response?
    func presentResponse(_ response: GistListModel.Response) {
      self.response = response
    }
  }
  
  final class GistListServiceDouble: GistListServiceProtocol {
    enum RequestType {
      case none
      case empty
      case value
      case noInternet
      case error
    }
    
    var requestType: RequestType = .none
    
    func gistRequest(requestHeader: GistRequestQuery, completion: @escaping GistListPaginationCompletion) {
      switch requestType {
      case .none:
        ()
      case .empty:
        completion(.success([]))
      case .value:
        completion(.success([]))
      case .noInternet:
        completion(.failure(.noConnection))
      case .error:
        completion(.failure(.wrongData))
      }
    }
  }
}
