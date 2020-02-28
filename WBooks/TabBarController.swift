//
//  TabBarController.swift
//  WBooks
//
//  Created by Megan Cole on 22/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray

        let library = UINavigationController(rootViewController: LibraryController(viewModel: LibraryViewModel()))
        library.tabBarItem = UITabBarItem()
        library.tabBarItem.title = "LIBRARY_TAB_BAR_TITLE".localized()
        library.tabBarItem.image = UIImage.libraryActive
        library.tabBarItem.tag = 0
        
        let wishlist = UINavigationController(rootViewController: WishlistController())
        wishlist.tabBarItem = UITabBarItem()
        wishlist.tabBarItem.title = "WISHLIST_TAB_BAR_TITLE".localized()
        wishlist.tabBarItem.image = UIImage.wishlistActive
        wishlist.tabBarItem.tag = 1
        
        let addNew = UINavigationController(rootViewController: AddNewController())
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = "ADD_NEW_TAB_BAR_TITLE".localized()
        addNew.tabBarItem.image = UIImage.addNewActive
        addNew.tabBarItem.tag = 2

        let rentals = UINavigationController(rootViewController: RentalsController())
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = "RENTALS_TAB_BAR_TITLE".localized()
        rentals.tabBarItem.image = UIImage.rentalsActive
        rentals.tabBarItem.tag = 3

        let settings = UINavigationController(rootViewController: SettingsController())
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = "SETTINGS_TAB_BAR_TITLE".localized()
        settings.tabBarItem.image = UIImage.settingsActive
        settings.tabBarItem.tag = 4

        viewControllers = [library, wishlist, addNew, rentals, settings]
    }
}
