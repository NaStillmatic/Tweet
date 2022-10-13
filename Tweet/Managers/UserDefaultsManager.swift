//
//  UserDefaultsManager.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import Foundation

protocol UserDefaultsManagerProtocol {
  func getTweet() -> [Tweet]
  func setTweet(_ newValue: Tweet)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {

  enum Key: String {
    case tweet

    var value: String {
      self.rawValue
    }
  }

  func getTweet() -> [Tweet] {
    guard let data = UserDefaults.standard.data(forKey: Key.tweet.value) else { return [] }

    return (try? PropertyListDecoder().decode([Tweet].self, from: data)) ?? []
  }

  func setTweet(_ newValue: Tweet) {
    var curremtTweet: [Tweet] = getTweet()
      curremtTweet.insert(newValue, at: 0)

      UserDefaults.standard.setValue(try? PropertyListEncoder().encode(curremtTweet),
                                     forKey: Key.tweet.value)
  }
}
