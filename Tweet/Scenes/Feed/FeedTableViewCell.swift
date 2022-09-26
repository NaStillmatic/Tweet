//
//  FeedTableViewCell.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import UIKit
import SnapKit

final class FeedTableViewCell: UITableViewCell {

  static let identifier = "FeedTableViewCell"

  private lazy var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .lightGray
    imageView.layer.cornerRadius = 21.0
    return imageView
  }()

  private lazy var writerNameLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0, weight: .bold)
    return label
  }()

  private lazy var writerAccountLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14.0, weight: .medium)
    label.textColor = .secondaryLabel
    return label
  }()

  private lazy var contentsLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0, weight: .medium)
    label.numberOfLines = 0
    return label
  }()

  private lazy var likeButton: UIButton = {
    let button = UIButton()
    button.setImage(Icon.like.image, for: .normal)
    button.tintColor = .secondaryLabel
    return button
  }()

  private lazy var commentButton: UIButton = {
    let button = UIButton()
    button.setImage(Icon.message.image, for: .normal)
    button.tintColor = .secondaryLabel
    return button
  }()

  private lazy var shareButton: UIButton = {
    let button = UIButton()
    button.setImage(Icon.share.image, for: .normal)
    button.tintColor = .secondaryLabel
    return button
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    setupLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup(tweet: Tweet) {
    writerNameLabel.text = tweet.user.name
    writerAccountLabel.text = "@\(tweet.user.account)"
    contentsLabel.text = tweet.contents
  }
}

private extension FeedTableViewCell {

  func setupLayout() {
    let buttonStackView = UIStackView(arrangedSubviews: [likeButton,
                                                         commentButton,
                                                         shareButton])
    buttonStackView.axis = .horizontal
    buttonStackView.distribution = .fillEqually

    [
      profileImageView,
      writerNameLabel,
      writerAccountLabel,
      contentsLabel,
      buttonStackView
    ].forEach { contentView.addSubview($0) }

    let superViewMargin: CGFloat = 16.0
    profileImageView.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(superViewMargin)
      $0.top.equalToSuperview().inset(superViewMargin)
      $0.width.height.equalTo(42)
    }

    writerNameLabel.snp.makeConstraints {
      $0.leading.equalTo(profileImageView.snp.trailing).offset(superViewMargin)
      $0.top.equalTo(profileImageView.snp.top)
    }

    writerAccountLabel.snp.makeConstraints {
      $0.leading.equalTo(writerNameLabel.snp.trailing).offset(2.0)
      $0.bottom.equalTo(writerNameLabel.snp.bottom)
    }

    contentsLabel.snp.makeConstraints {
      $0.leading.equalTo(writerNameLabel.snp.leading)
      $0.top.equalTo(writerNameLabel.snp.bottom).offset(4.0)
      $0.trailing.equalToSuperview().inset(superViewMargin)
    }

    buttonStackView.snp.makeConstraints {
      $0.leading.equalTo(writerNameLabel.snp.leading)
      $0.trailing.equalTo(contentsLabel.snp.trailing)
      $0.top.equalTo(contentsLabel.snp.bottom).offset(12.0)
      $0.bottom.equalToSuperview().inset(superViewMargin)
    }
  }
}
