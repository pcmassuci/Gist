//
//  ServiceError.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

import Foundation

enum ServiceError: Error {
  case decodeError(NSError)
  case emptyAPI
  case wrongData
  case noConnection
}
