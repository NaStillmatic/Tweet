//
//  FeedPresenter.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import UIKit

protocol FeedProtocol: AnyObject {

  func setupViews()
  func reloadTableView()
  func moveToTweetViewController(with tweet: Tweet)
  func moveToWriteViewController()
}

final class FeedPresenter: NSObject {
  
  private weak var viewController: FeedProtocol?
  private let userDefaultsManager: UserDefaultsManagerProtocol

  var tweets: [Tweet] = []

  init(viewController: FeedProtocol,
       userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
    self.viewController = viewController
    self.userDefaultsManager = userDefaultsManager
  }

  func viewDidLoad() {
    viewController?.setupViews()
    tweets = UserDefaultsManager().getTweet()
  }

  func viewWillAppear() {
      tweets = userDefaultsManager.getTweet()
      viewController?.reloadTableView()
  }

  func didTapWriteButton() {
    viewController?.moveToWriteViewController()
  }
}

extension FeedPresenter: UITableViewDataSource {

  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }

  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier,
                                                   for: indexPath) as? FeedTableViewCell else {
      return UITableViewCell()
    }

    let tweet = tweets[indexPath.row]
    cell.setup(tweet: tweet)
    return cell
  }
}

extension FeedPresenter: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let tweet = tweets[indexPath.row]
    viewController?.moveToTweetViewController(with: tweet)
  }
}

