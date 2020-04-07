//
//  BookViewModel.swift
//  WBooks
//
//  Created by Megan Cole on 28/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class BookViewModel {
    let book: Book

    init(book: Book) {
        self.book = book
    }
    
    var id: String {
        return String(book.id)
    }

    var title: String {
        return book.title
    }

    var author: String {
        return book.author
    }

    var genre: String {
        return book.genre
    }

    var year: String {
        return book.year
    }
    
    var status: BookStatus {
        return BookStatus(rawValue: book.status) ?? .unknown
    }

    var image: String {
        return book.image
    }
}

enum BookStatus: String, CaseIterable {
    case available
    case inYourHands
    case unavailable
    case unknown
    
    func label() -> String {
        switch self {
        case .available:
            return "AVAILABLE_STATUS".localized()
        default:
            return "UNAVAILABLE_STATUS".localized()
        }
    }
}
