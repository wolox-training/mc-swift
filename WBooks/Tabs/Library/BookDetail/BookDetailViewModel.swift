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
    public var bookVM: BookViewModel!
    private var comments: [Comment] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    var onUpdate: (() -> Void)?

    init(with selectedBook: BookViewModel) {
        bookVM = selectedBook
    }

    public func numberOfCells() -> Int {
        return comments.count
    }

    public func getComments() {
        commentRepository.fetchComments(book: bookVM.book, onSuccess: { [weak self] (comments) in
            self?.comments = comments
        }, onError: { (error) in
            print(error)
        })
    }
    
    public func getCellComment(at indexPath: IndexPath) -> Comment {
        return comments[indexPath.row]
    }
    
    public func rentBook() {
        let onSuccessRent: (Rent) -> Void = {
            (rent) in
            print ("Book rent \(rent).")
        }
        
        let onFailureRent: (Error) -> Void = {
            (error) in
            print ("Book rent error \(error).")
        }
        
        rentRepository.rentBook(book: bookVM.book, onSuccess: onSuccessRent, onError: onFailureRent)
    }
}
