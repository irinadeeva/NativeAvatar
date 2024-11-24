//
//  ViewController.swift
//  Task8NativeAvatar
//
//  Created by Irina Deeva on 22/11/24.
//

import UIKit

final class ViewController: UIViewController {

  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false

    return scrollView
  }()

  private lazy var headerView: UIView = {
    let headerView = UIView()
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.backgroundColor = .white
    return headerView
  }()

  private lazy var titleLabel: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.textColor = .black
    title.font = .systemFont(ofSize: 30, weight: .bold)
    title.text = "Avatar"
    return title
  }()

  private lazy var avatarImageView: UIImageView = {
    let avatarImageView = UIImageView()
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    avatarImageView.image = UIImage(systemName: "person.crop.circle.fill")
    avatarImageView.contentMode = .scaleAspectFill
    avatarImageView.tintColor = .lightGray
    return avatarImageView
  }()

  private lazy var navBar = UINavigationBar(frame: CGRect(x: 0,
                                                          y: 100,
                                                          width: UIScreen.main.bounds.size.width, height: 90))

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(scrollView)
    view.addSubview(navBar)
    scrollView.addSubview(headerView)
    scrollView.delegate = self

    let center = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 90))
    center.text = "Avatar"
    center.font = UIFont.systemFont(ofSize: 21, weight: .bold)
    center.textAlignment = .center
//    navigationItem.titleView = center


    let navItem = UINavigationItem()
    navItem.titleView = center

//    navItem.prompt = ""

    navItem.style = .





    //    navBar.topItem?.title = "Avatar"

    navBar.items = [navItem]

    //    navBar.titleTextAttributes

    //    navBar.topItem?.title = "Avatar"

    //    let navigationItem = UINavigationItem()
    //    navigationItem.titleView = UILabel().text = "Avatar"
    //    // Устанавливаем topItem через метод push
    //    navBar.topItem = navigationItem.titleView.

    navBar.isHidden = true

    headerView.addSubview(titleLabel)
    headerView.addSubview(avatarImageView)

    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      headerView.heightAnchor.constraint(equalToConstant: 100), // change to 1000 and delete content
      headerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      headerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      //      headerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor) //uncomment when change to 1000

      titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
      //      titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
      titleLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),

      avatarImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
      avatarImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
      avatarImageView.heightAnchor.constraint(equalToConstant: 50),
      avatarImageView.widthAnchor.constraint(equalToConstant: 50)
    ])

    addContentViews()
  }

  private func addContentViews() {
    let contentView = UIView()
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.backgroundColor = .white
    scrollView.addSubview(contentView)

    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      contentView.heightAnchor.constraint(equalToConstant: 1000)
    ])
  }
}

extension ViewController: UIScrollViewDelegate {

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offset = scrollView.contentOffset.y
    if offset > 0 {
      navBar.isHidden = false
      navBar.barStyle = UIBarStyle.default
    } else {
      navBar.isHidden = true

    }
  }
}

