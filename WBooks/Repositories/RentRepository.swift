//
//  RentRepository.swift
//  WBooks
//
//  Created by Megan Cole on 19/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Result
import UIKit
import Alamofire

internal class RentRepository {
    public func rentBook(book: Book, onSuccess: @escaping (Rent) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: "https://swift-training-backend.herokuapp.com/users/2/rents") else { return }
        let params: [String: Any] = [
            "userID": 2,
            "bookID": book.id,
            "from": Date.formattedDate(with: Date()),
            "to": Date.formattedDate(with: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
        ]
        let headers = ["Content-Type": "application/json", "Accept": "application/json"]

        request(url, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let JSONrent = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(RentError.decodeError)
                    return
                }
                guard let rent = try? JSONDecoder().decode(Rent.self, from: JSONrent) else {
                    onError(RentError.decodeError)
                    return
                }
                onSuccess(rent)
            case .failure(let error):
                onError(error)
            }
        }
    }
}

enum RentError: Error {
    case decodeError
}
