//
//  CommentCell.swift
//  WBooks
//
//  Created by Megan Cole on 17/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class CommentCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var avatar: UIImageView!

    @IBOutlet weak var cell: UIView! {
        didSet {
            cell.layer.cornerRadius = 8
            cell.backgroundColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
    }
}
