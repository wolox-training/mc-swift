//
//  RentalsController.swift
//  WBooks
//
//  Created by Megan Cole on 22/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class RentalsController: BaseViewController {

    private let _view: RentalsView = RentalsView.loadFromNib()!

    override func loadView() {
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RENTALS_TAB_BAR_TITLE".localized()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "RENTALS_NAV_BAR_TITLE".localized()
    }
}
