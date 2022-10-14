//
//  WritePresenterTests.swift
//  TweetTests
//
//  Created by HwangByungJo  on 2022/10/14.
//

import XCTest
@testable import Tweet

class WritePresenterTests: XCTestCase {

  var sut: WritePresenter!
  var viewController: MockWriteViewController!
  var userDefaultsManager: MockUserDefaultsManager!


  override func setUp() {
    super.setUp()

    viewController = MockWriteViewController()
    userDefaultsManager = MockUserDefaultsManager()
    sut = WritePresenter(viewController: viewController,
                         userDefaultsManager: userDefaultsManager)
  }

  override func tearDown() {
    sut = nil
    userDefaultsManager = nil
    viewController = nil

    super.tearDown()
  }

  func test_viewDidLoad가_요청되면() {
    sut.viewDidLoad()
    XCTAssertTrue(viewController.isCalledSetupViews)
  }

  func test_didTapLeftBarButtonItem가_요청되면() {
    sut.didTapLeftBarButtonItem()
    XCTAssertTrue(viewController.isCalledDismiss)
  }

  func test_didTapRightBarButtonItem이_요청되먄() {
    sut.didTapRightBarButtonItem(text: "")
    XCTAssertTrue(userDefaultsManager.isCalledSetTweet)
    XCTAssertTrue(viewController.isCalledDismiss)
  }
}
