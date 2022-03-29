//
//  GistResponseTest.swift
//  GistTests
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

@testable import Gist
import XCTest

class GistResponseTest: XCTestCase {
  func testConvertJsonFile() throws {
    let gist = try getObejct()
    
    XCTAssertEqual(gist.count, 30)
  }
  
  func testFirstsonFile() throws {
    let gist = try getObejct()
    guard let first = gist.first else {
      XCTFail("Object is empty")
      return
    }

    XCTAssertEqual(first.url, "https://api.github.com/gists/77671c9278e2e0fb746f964ccdb20364")
    XCTAssertEqual(first.forksUrl, "https://api.github.com/gists/77671c9278e2e0fb746f964ccdb20364/forks")
    XCTAssertEqual(first.commitsUrl, "https://api.github.com/gists/77671c9278e2e0fb746f964ccdb20364/commits")
    XCTAssertEqual(first.id, "77671c9278e2e0fb746f964ccdb20364")
    XCTAssertEqual(first.nodeId, "G_kwDOAPjl8NoAIDc3NjcxYzkyNzhlMmUwZmI3NDZmOTY0Y2NkYjIwMzY0")
    XCTAssertEqual(first.gitPullUrl, "https://gist.github.com/77671c9278e2e0fb746f964ccdb20364.git")
    XCTAssertEqual(first.gitPushUrl, "https://gist.github.com/77671c9278e2e0fb746f964ccdb20364.git")
    XCTAssertEqual(first.htmlUrl, "https://gist.github.com/77671c9278e2e0fb746f964ccdb20364")
    XCTAssertEqual(first.`public`, true)
    XCTAssertEqual(first.createdAt, "2022-03-27T14:07:06Z")
    XCTAssertEqual(first.updatedAt, "2022-03-27T14:07:06Z")
    XCTAssertEqual(first.description, "Echoes of an Offering average rate [genshin]")
    XCTAssertEqual(first.comments, 0)
    XCTAssertEqual(first.user, nil)
    XCTAssertEqual(first.commentsUrl, "https://api.github.com/gists/77671c9278e2e0fb746f964ccdb20364/comments")
    XCTAssertEqual(first.truncated, false)
  }

  func testObjectFiles() throws {
    let gist = try getObejct()
    guard let first = gist.first,
          let files = first.files,
          let firstFile = files["Echoes-of-an-Offering.py"] else {
      XCTFail("Object is empty")
      return
    }
    
    XCTAssertEqual(files.count, 1)
    XCTAssertEqual(firstFile.type,"application/x-python")
    XCTAssertEqual(firstFile.language,"Python")
    XCTAssertEqual(firstFile.rawUrl,"https://gist.githubusercontent.com/NiuWeb/77671c9278e2e0fb746f964ccdb20364/raw/7c4895bac185ed933cdd058face038c74a4c090e/Echoes-of-an-Offering.py")
    XCTAssertEqual(firstFile.size, 287)
  }

  private func getObejct() throws -> [GistResponse] {
    guard let url = Bundle.main.url(
      forResource: "GistObject",
      withExtension: "json") else {
      throw NSError(
        domain: NSURLErrorDomain,
        code: NSURLErrorResourceUnavailable)
    }

    let data = try Data(contentsOf: url)
    let decoder = JSONDecoder()
    return try decoder.decode(
      [GistResponse].self,
      from: data)
  }
}
