//
//  FeedViewController.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import UIKit
import Floaty
import SnapKit

final class FeedViewControler: UIViewController {

  private lazy var presenter = FeedPresenter(viewController: self)

  private lazy var writeButon: Floaty = {
    let btn = Floaty(size: 50.0)
    btn.sticky = true
    btn.handleFirstItemDirectly = true
    btn.addItem(title: "") { [weak self] _ in
      self?.presenter.didTapWriteButton()
    }
    btn.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
    return btn
  }()

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = presenter
    tableView.dataSource = presenter
    tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter.viewDidAppear()
  }
}

extension FeedViewControler: FeedProtocol {

  func setupViews() {
    navigationItem.title = "Feed"

    [
      tableView,
      writeButon
    ].forEach { view.addSubview( $0) }

    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    writeButon.paddingY = 100.0
  }

  func reloadTableView() {
    tableView.reloadData()
  }

  func moveToTweetViewController(with tweet: Tweet) {
    let tweetViewController = TweetViewController(tweet: tweet)
    navigationController?.pushViewController(tweetViewController, animated: true)
  }

  func moveToWriteViewController() {
    let writeViewController = UINavigationController(rootViewController: WriteViewController())
    writeViewController.modalPresentationStyle = .fullScreen
    present(writeViewController, animated: true)
  }
}
