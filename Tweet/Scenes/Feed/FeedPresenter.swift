//
//  FeedPresenter.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import UIKit

protocol FeedProtocol: AnyObject {

  func setupViews()
}

final class FeedPresenter: NSObject {
  
  private weak var viewController: FeedProtocol?

  var tweetList: [Tweet] = []

  init(viewController: FeedProtocol) {
    self.viewController = viewController
  }

  func viewDidLoad() {
    viewController?.setupViews()

    tweetList = UserDefaultManager().getTweet()
  }
}

extension FeedPresenter: UITableViewDataSource {

  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return tweetList.count
  }

  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier,
                                                   for: indexPath) as? FeedTableViewCell else {
      return UITableViewCell()
    }

    let tweet = tweetList[indexPath.row]
    cell.setup(tweet: tweet)
    return cell
  }
}

extension FeedPresenter: UITableViewDelegate {}

