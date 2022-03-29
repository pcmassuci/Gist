//
//  GistTableViewCell.swift
//  Gist
//
//  Created by Paulo Cesar Morandi Massuci on 27/03/22.
//

import Kingfisher
import UIKit

final class GistTableViewCell: UITableViewCell {
  struct Model {
    let userName: String
    let urlImage: String?
    let fileType: String
  }
  
  var model: Model? {
    didSet {
      didSetModel()
    }
  }

  private lazy var avatarImageView = UIImageView()
  private lazy var userNameLabel = UILabel()
  private lazy var fileTypeLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    applyViewCode()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    userNameLabel.text = String()
    fileTypeLabel.text = String()
    avatarImageView.image = nil
  }

  private func didSetModel() {
    userNameLabel.text = model?.userName
    fileTypeLabel.text = model?.fileType

    if let urlPhoto = URL(string: model?.urlImage ?? String()) {
      avatarImageView.kf.setImage(with: urlPhoto)
    }
  }
}

extension GistTableViewCell: ViewCodeConfiguration {
  func buildHierarchy() {
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    userNameLabel.translatesAutoresizingMaskIntoConstraints = false
    fileTypeLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(avatarImageView)
    addSubview(userNameLabel)
    addSubview(fileTypeLabel)
  }

  func setupContraints() {
    let avatarImageViewConstraints = [
      avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
      avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
      avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
      avatarImageView.heightAnchor.constraint(equalToConstant: 40),
      avatarImageView.widthAnchor.constraint(equalToConstant: 40)
    ]

    let userNameLabelViewConstraints = [
      userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
      userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
      userNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
    ]

    let fileTypeLabelConstraints = [
      fileTypeLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
      fileTypeLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
      fileTypeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
      fileTypeLabel.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
    ]

    NSLayoutConstraint.activate(avatarImageViewConstraints + userNameLabelViewConstraints + fileTypeLabelConstraints)
  }

  func configureViews() {
    backgroundColor = .offWhite
    userNameLabel.textColor = .themeBlue
    fileTypeLabel.textColor = .themeBlue
  }
}
