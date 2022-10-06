//
//  ProfilePresenter.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/10/06.
//

import Foundation

protocol ProfileProtocol: AnyObject {

  func setupViews()
  func setViews(with name: String, account: String)
  func endEdting()
}

final class ProfilePresenter {

  private weak var viewController: ProfileProtocol?

  private var user: User {
    get{ User.shared }
    set{ User.shared = newValue }
  }

  init(viewController: ProfileProtocol? = nil) {
    self.viewController = viewController
  }

  func viewDidLoad() {
    viewController?.setupViews()
    viewController?.setViews(with: user.name, account: user.account)
  }

  func didTapSaveButton(name: String?, account: String?) {
    guard let name = name,
          let account = account,
          !name.isEmpty, !account.isEmpty else { return }

    user.name = name
    user.account = account

    viewController?.setViews(with: user.name, account: user.account)
    viewController?.endEdting()
  }
}
