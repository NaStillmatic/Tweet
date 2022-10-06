//
//  User.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import Foundation

struct User: Codable {

  var name: String
  var account: String

  static var shared = User(name: "iDeveloper",
                           account: "NaStillmatic")
}
