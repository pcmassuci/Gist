//
//  NSObjectExtension.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

import Foundation

extension NSObject {
  var className: String {
    return String(describing: type(of: self)).components(separatedBy: ".").last ?? String()
  }
  
  static var className: String {
    return String(describing: self).components(separatedBy: ".").last ?? String()
  }
}
