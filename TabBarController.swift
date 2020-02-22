//
//  TabBarController.swift
//  WBooks
//
//  Created by Megan Cole on 22/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .white
        
        let mainMenu = UINavigationController(rootViewController: MainMenuController())
        mainMenu.tabBarItem = UITabBarItem()
        mainMenu.tabBarItem.title = title
        mainMenu.tabBarItem.image = UIImage(named: "ic_library.png")
        mainMenu.tabBarItem.tag = 0

        viewControllers = [mainMenu]
    }
}
