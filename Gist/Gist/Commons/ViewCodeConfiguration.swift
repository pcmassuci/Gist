//
//  ViewCodeConfiguration.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

protocol ViewCodeConfiguration {
  func buildHierarchy()
  func setupContraints()
  func configureViews()
}

extension ViewCodeConfiguration {
  func applyViewCode() {
    buildHierarchy()
    setupContraints()
    configureViews()
  }
}
