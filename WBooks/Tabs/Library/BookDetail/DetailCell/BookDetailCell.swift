//
//  BookDetail.swift
//  WBooks
//
//  Created by Megan Cole on 16/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Kingfisher

class BookDetailCell: UIView, NibLoadable {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookStatus: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookGenre: UILabel!
    @IBOutlet weak var bookCover: UIImageView!

    @IBOutlet weak var cell: UIView! {
        didSet {
            cell.layer.cornerRadius = 8
            cell.backgroundColor = .white
        }
    }
    
    weak var delegate: BookDetailCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    func setup(book: BookViewModel) {
        bookTitle.text = book.title
        bookAuthor.text = book.author
        bookYear.text = book.year
        bookGenre.text = book.genre
        if let url = URL(string: book.image) {
            let resource = ImageResource(downloadURL: url)
            bookCover.kf.indicatorType = .activity
            bookCover.kf.setImage(with: resource, placeholder: UIImage.coverUnavailable)
        } else {
            bookCover.image = UIImage.coverUnavailable
        }
        bookStatus.text = book.status.label()
        if bookStatus.text == "AVAILABLE_STATUS".localized() {
            bookStatus.textColor = .green
            rentButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            bookStatus.textColor = .red
            rentButton.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var addToWishlistButton: UIButton! {
        didSet {
            addToWishlistButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
            addToWishlistButton.setTitle("WISHLIST_ADD_BUTTON".localized(), for: .normal)
            addToWishlistButton.setTitleColor(UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1), for: .normal)
            addToWishlistButton.layer.cornerRadius = 25
            addToWishlistButton.layer.borderWidth = 1
            addToWishlistButton.layer.backgroundColor = (UIColor.white).cgColor
            addToWishlistButton.layer.borderColor = UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1).cgColor
        }
    }
    
    @IBAction func addToWishlistButton(_ sender: Any) {
        delegate?.addToWishlist()
    }

    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.titleLabel?.font = UIFont(name: "TrebuchetMS-Bold", size: 20)
            rentButton.setTitle("RENT_BUTTON".localized(), for: .normal)
            rentButton.setTitleColor(UIColor.white, for: .normal)
            rentButton.layer.cornerRadius = rentButton.layer.frame.height/2
            rentButton.layer.backgroundColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1).cgColor
            rentButton.layer.borderWidth = 1
        }
    }
    
    @IBAction func rentButton(_ sender: Any) {
        delegate?.rentBook()
    }
}

protocol BookDetailCellDelegate: class {
    func addToWishlist()
    func rentBook()
}
