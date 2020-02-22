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
        
        let library = UINavigationController(rootViewController: LibraryController())
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = title
        library.tabBarItem.image = UIImage(named: "ic_library.png")
        library.tabBarItem.tag = 0
        
        let wishlist = UINavigationController(rootViewController: WishlistController())
        wishlist.tabBarItem = UITabBarItem()
        wishlist.tabBarItem.title = title
        wishlist.tabBarItem.image = UIImage(named: "ic_wishlist.png")
        wishlist.tabBarItem.tag = 1
        
        let addNew = UINavigationController(rootViewController: AddNewController())
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = title
        addNew.tabBarItem.image = UIImage(named: "ic_add_new.png")
        addNew.tabBarItem.tag = 2

        let rentals = UINavigationController(rootViewController: RentalsController())
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = title
        rentals.tabBarItem.image = UIImage(named: "ic_myrentals.png")
        rentals.tabBarItem.tag = 3

        let settings = UINavigationController(rootViewController: SettingsController())
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = title
        settings.tabBarItem.image = UIImage(named: "ic_settings.png")
        settings.tabBarItem.tag = 4

        viewControllers = [library, wishlist, addNew, rentals, settings]
    }
}
