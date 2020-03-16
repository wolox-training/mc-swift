//
//  Rent.swift
//  WBooks
//
//  Created by Megan Cole on 13/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

struct WBRent: Codable {
    let id: Int
    let book: Book
    let user: User
    let from: String
    let to: String

    enum CodingKeys: String, CodingKey {
        case id
        case book
        case user
        case from
        case to
    }

}
