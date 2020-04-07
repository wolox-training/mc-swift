//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Megan Cole on 28/02/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

class LibraryViewModel {
    private var bookRepository = BookRepository()

    public var books: [BookViewModel] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    public var bookItems: [Book] = []

    var onUpdate: (() -> Void)?

    public func numberOfCells() -> Int {
        return books.count
    }
    
    func getBookList() {
        let onSuccessBooks: ([Book]) -> Void = { (booksArray) in
            self.bookItems = booksArray
            self.books = self.bookItems.map { BookViewModel(book: $0) }
        }

        bookRepository.fetchBooks(onSuccess: onSuccessBooks, onError: { (error) in
            print(error)
        })
    }

    func getCellBook(at indexPath: IndexPath) -> BookViewModel {
        return books[indexPath.row]
    }
}
