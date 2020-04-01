//
//  BookDetailView.swift
//  WBooks
//
//  Created by Megan Cole on 16/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import SwiftUI
import WolmoCore

class BookDetailView: UIView, NibLoadable {
    @IBOutlet weak var bookDetailCell: BookDetailCell!
    @IBOutlet weak var detailTable: UITableView! {
        didSet {
            detailTable.backgroundColor = .backgroundColor()
            detailTable.separatorStyle = .none
        }
    }
}
