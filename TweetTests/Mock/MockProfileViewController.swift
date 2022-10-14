//
//  MockProfileViewController.swift
//  TweetTests
//
//  Created by HwangByungJo  on 2022/10/14.
//

import XCTest
@testable import Tweet

final class MockProfileViewController: ProfileProtocol {

  var isCalledSetupViews = false
  var isCalledSetViews = false
  var isCalledEndEditing = false
  var isCalledShowToast = false

  func setupViews() {
    isCalledSetupViews = true
  }

  func setViews(with name: String, account: String) {
    isCalledSetViews = true
  }

  func endEdting() {
    isCalledEndEditing = true
  }

  func showToast() {
    isCalledShowToast = true
  }
}
