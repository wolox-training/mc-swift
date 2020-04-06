//
//  CommentRepository.swift
//  WBooks
//
//  Created by Megan Cole on 18/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Result
import UIKit
import Alamofire

internal class CommentRepository {
    public func fetchComments(book: Book, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: "https://swift-training-backend.herokuapp.com/books/\(book.id)/comments") else { return }
        request(url, method: .get, headers: ["Content-Type": "application/json",
        "Accept": "application/json"]).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let JSONcomments = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(CommentError.decodeError)
                    return
                }
                guard let comments = try? JSONDecoder().decode([Comment].self, from: JSONcomments) else {
                    onError(CommentError.decodeError)
                    return
                }
                onSuccess(comments)
            case .failure(let error):
                onError(error)
            }
        }
    }
}

enum CommentError: Error {
    case decodeError
}
