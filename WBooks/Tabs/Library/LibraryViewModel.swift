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

    public var books: [Book] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    var onUpdate: (() -> Void)?

    public func numberOfCells() -> Int {
        return books.count
    }
    
    func getBookList() {
        bookRepository.fetchBooks(onSuccess: { [weak self] (books) in
            self?.books = books
        }, onError: { (error) in
            print(error)
        })
    }

    func getCellBook(at indexPath: IndexPath) -> Book {
        return books[indexPath.row]
    }
}
