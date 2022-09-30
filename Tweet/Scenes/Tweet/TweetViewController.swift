//
//  TweetViewController.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/30.
//

import UIKit

final class TweetViewController: UIViewController {

  private var presenter: TweetPresenter!

  init(tweet: Tweet) {
    super.init(nibName: nil, bundle: nil)

    presenter = TweetPresenter(viewController: self, tweet: tweet)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension TweetViewController: TweetProtocol {}
