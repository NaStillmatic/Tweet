//
//  TabBarViewController.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import UIKit

final class TabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let tabBarViewControllers: [UIViewController] = TabBarItem.allCases.map { tabCase in
      let viewController = tabCase.viewController
      viewController.tabBarItem = UITabBarItem(title: tabCase.title,
                                               image: tabCase.icon.default,
                                               selectedImage: tabCase.icon.selected)
      return viewController
    }
    self.viewControllers = tabBarViewControllers
  }
}

