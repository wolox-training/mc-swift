//
//  WishlistController.swift
//  WBooks
//
//  Created by Megan Cole on 22/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class WishlistController: BaseViewController {

    private let _view: WishlistView = WishlistView.loadFromNib()!

    override func loadView() {
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WISHLIST_TAB_BAR_TITLE".localized()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "WISHLIST_NAV_BAR_TITLE".localized()
    }
}
