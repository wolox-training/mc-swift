//
//  BaseViewController.swift
//  WBooks
//
//  Created by Megan Cole on 11/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        let navBar = navigationController!.navigationBar
        navBar.tintColor = .white
        navBar.barTintColor = UIColor.backgroundColor()
        navBar.shadowImage = UIImage()
        navBar.setBackgroundImage(UIImage(named: "bc_nav_bar"), for: .default)
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setBackgroundImageSize(UIImage(named: "bc_nav_bar")!)
    }
    
    private func setBackgroundImageSize(_ image: UIImage) {
        navigationController!.navigationBar.isTranslucent = true
        navigationController!.navigationBar.barStyle = .blackTranslucent
        let logoImageView = UIImageView(image: image)
        view.insertSubview(logoImageView, belowSubview: navigationController!.navigationBar)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let height: CGFloat = UIScreen.main.bounds.width * (image.size.height) / (image.size.width)
        NSLayoutConstraint.activate([
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
