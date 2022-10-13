//
//  MockFeedViewController.swift
//  TweetTests
//
//  Created by HwangByungJo  on 2022/10/13.
//

import Foundation
@testable import Tweet

final class MockFeedViewController: FeedProtocol {

  var isCalledSetupViews = false
  var isCalledReloadTableView = false
  var isCalledMoveToTweetViewController = false
  var isCalledMoveToWriteViewController = false

  func setupViews() {

    isCalledSetupViews = true
  }

  func reloadTableView() {

    isCalledReloadTableView = true
  }

  func moveToTweetViewController(with tweet: Tweet) {
    isCalledMoveToTweetViewController = true
  }

  func moveToWriteViewController() {
    isCalledMoveToWriteViewController = true
  }
}
