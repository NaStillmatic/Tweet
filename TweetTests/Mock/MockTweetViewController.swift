//
//  MockTweetViewController.swift
//  TweetTests
//
//  Created by HwangByungJo  on 2022/10/14.
//

import XCTest
@testable import Tweet

final class MockTweetViewController: TweetProtocol {

  var isCalledSetViews = false
  var isCalledSetupViews = false


  func setViews(tweet: Tweet) {
    isCalledSetViews = true
  }

  func setupViews() {
    isCalledSetupViews = true
  }
}
