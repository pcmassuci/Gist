//
//  GistRequestQuery.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

struct GistRequestQuery: Encodable {
  private enum CodingKeys: String, CodingKey {
    case page
    case perPage = "per_page"
  }
  
  let page: String
  let perPage: String
  
  init(page: Int, perPage: Int = 30) {
    self.page = String(page)
    self.perPage = String(perPage)
  }
}
