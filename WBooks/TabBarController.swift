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
        
        let wishlist: WishlistController = WishlistController()
        wishlist.tabBarItem = UITabBarItem()
        wishlist.tabBarItem.title = title
        wishlist.tabBarItem.image = UIImage(named: "ic_wishlist.png")
        wishlist.tabBarItem.tag = 1
        
        let addNew: AddNewController = AddNewController()
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = title
        addNew.tabBarItem.image = UIImage(named: "ic_add_new.png")
        addNew.tabBarItem.tag = 2

        let rentals: RentalsController = RentalsController()
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = title
        rentals.tabBarItem.image = UIImage(named: "ic_myrentals.png")
        rentals.tabBarItem.tag = 3

        let settings: SettingsController = SettingsController()
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = title
        settings.tabBarItem.image = UIImage(named: "ic_settings.png")
        settings.tabBarItem.tag = 4

//        viewControllers = [mainMenu]
        viewControllers = [mainMenu, wishlist, addNew, rentals, settings]
    }
}
