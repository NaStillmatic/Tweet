//
//  FeedViewController.swift
//  Tweet
//
//  Created by HwangByungJo  on 2022/09/26.
//

import UIKit
import SnapKit

final class FeedViewControler: UIViewController {

  private lazy var presenter = FeedPresenter(viewController: self)

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
}

extension FeedViewControler: FeedProtocol {

  func setupViews() {
    navigationItem.title = "Feed"

    view.addSubview(tableView)

    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
