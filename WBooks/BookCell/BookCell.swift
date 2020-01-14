//
//  BookCell.swift
//  WBooks
//
//  Created by Megan Cole on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class BookCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
}
