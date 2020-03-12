//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Megan Cole on 28/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class LibraryViewModel {
    public let books: [BookViewModel] = [
        BookViewModel(book: Book(title: "A Little Bird Told Me", author: "Timothy Cross", cover: UIImage.book1)),
        BookViewModel(book: Book(title: "When The Doves Disappeared", author: "Sofi Oksanen", cover: UIImage.book2)),
        BookViewModel(book: Book(title: "The Best Book In The World", author: "Peter Sjernstrom", cover: UIImage.book3)),
        BookViewModel(book: Book(title: "Be Creative", author: "Tony Alcazar", cover: UIImage.book4)),
        BookViewModel(book: Book(title: "Redesign The Web", author: "Liliana Castilla", cover: UIImage.book5)),
        BookViewModel(book: Book(title: "The Yellow Book", author: "Big bird", cover: UIImage.book6))
    ]
    
    public func numberOfCells() -> Int {
        return books.count
    }
}
