//
//  ViewController.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let manager = UserDefaultManager()
    manager.setTweet(Tweet(user: User.shared, contents: "안녕하세요."))

    print(manager.getTweet())

  }


}

