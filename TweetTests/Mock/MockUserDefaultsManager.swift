//
//  MockUserDefaultsManager.swift
//  TweetTests
//
//  Created by HwangByungJo  on 2022/10/13.
//

import Foundation
@testable import Tweet

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
  var tweets: [Tweet] = []
  var newTweet: Tweet!

  var isCalledGetTweet = false
  var isCalledSetTweet = false

  func getTweet() -> [Tweet] {
    isCalledGetTweet = true
    return tweets
  }

  func setTweet(_ newValue: Tweet) {
    isCalledSetTweet = true
    newTweet = newValue
  }
}
