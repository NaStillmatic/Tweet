//
//  MockWriteViewController.swift
//  TweetTests
//
//  Created by HwangByungJo  on 2022/10/14.
//

import XCTest
@testable import Tweet

final class MockWriteViewController: WriteProtocol {
  var isCalledSetupViews = false
  var isCalledDismiss = false

  func setupViews() {
    isCalledSetupViews = true
  }

  func dismiss() {
    isCalledDismiss = true
  }
}
