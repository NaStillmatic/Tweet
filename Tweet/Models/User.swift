//
//  User.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import Foundation

struct User: Codable {

  let name: String
  let account: String

  static var shared = User(name: "iDeveloper", account: "NaStillmatic")
}
