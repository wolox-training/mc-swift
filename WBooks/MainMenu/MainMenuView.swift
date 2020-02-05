//
//  MainMenuView.swift
//  WBooks
//
//  Created by Megan Cole on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import SwiftUI
import WolmoCore

class MainMenuView: UIView, NibLoadable {
    @IBOutlet weak var booksTable: UITableView! {
        didSet {
            booksTable.backgroundColor = UIColor(red: 234/255, green: 246/255, blue: 251/255, alpha: 1)
            booksTable.separatorStyle = .none
        }
    }
}
