//
//  BookViewModel.swift
//  WBooks
//
//  Created by Megan Cole on 28/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class BookViewModel {
    private let _book: Book

    init(book: Book) {
        _book = book
    }
    
    var title: String { return _book.title }
    var author: String { return _book.author }
    var cover: UIImage { return _book.cover }
}
