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
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height * 2)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  private lazy var imageView: UIImageView = {
    let avatarImageView = UIImageView()
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    avatarImageView.image = UIImage(systemName: "person.crop.circle.fill")
    avatarImageView.contentMode = .scaleAspectFill
    avatarImageView.tintColor = .lightGray
    return avatarImageView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    view.addSubview(scrollView)

    title = "Avatar"
    guard let navigationBar = navigationController?.navigationBar else { return }
    navigationBar.prefersLargeTitles = true

    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

  }

  override func viewDidLayoutSubviews() {
    guard let navigationBar = navigationController?.navigationBar else { return }
    guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }

    navigationBar.subviews.forEach { subview in
                    if subview.isKind(of: UINavigationBarLargeTitleView.self) {

                      subview.addSubview(imageView)

                        NSLayoutConstraint.activate([
                          imageView.bottomAnchor.constraint(
                                equalTo: subview.bottomAnchor,
                                constant: -15
                            ),
                          imageView.trailingAnchor.constraint(
                                equalTo: subview.trailingAnchor,
                                constant: -view.directionalLayoutMargins.trailing
                            ),
                          imageView.widthAnchor.constraint(equalToConstant: 36),
                          imageView.heightAnchor.constraint(equalToConstant: 36)
                        ])
                    }
                }

  }
}
