//
//  BookDetailViewModel.swift
//  WBooks
//
//  Created by Megan Cole on 16/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Networking

import UIKit

class BookDetailViewModel {
    private var commentRepository = CommentRepository()
    private var rentRepository = RentRepository()
    public var book: Book!
    private var comments: [Comment] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    var onUpdate: (() -> Void)?

    init(with selectedBook: Book) {
        book = selectedBook
    }

    public func numberOfCells() -> Int {
        return comments.count
    }

    public func getComments() {
        commentRepository.fetchComments(book: book, onSuccess: { [weak self] (comments) in
            self?.comments = comments
        }, onError: { (error) in
            print(error)
        })
    }
    
    public func getCellComment(at indexPath: IndexPath) -> Comment {
        return comments[indexPath.row]
    }
    
    func rentBook(book: Book, onSuccessRent: @escaping (Rent) -> Void, onFailureRent: @escaping (Error) -> Void) {

       rentRepository.rentBook(book: book, onSuccess: onSuccessRent, onError: onFailureRent)
    }
}
