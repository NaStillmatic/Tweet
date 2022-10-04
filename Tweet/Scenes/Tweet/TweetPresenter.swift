//
//  TweetPresenter.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/30.
//

import Foundation

protocol TweetProtocol: AnyObject {
  
  func setViews(tweet: Tweet)
  func setupViews()
}

final class TweetPresenter {

  private let tweet: Tweet
  weak var viewController: TweetProtocol?

  init(viewController: TweetProtocol? = nil,
       tweet: Tweet) {
    self.viewController = viewController
    self.tweet = tweet
  }

  func viewDidLoad() {
    viewController?.setViews(tweet: tweet)
    viewController?.setupViews()
  }
}
