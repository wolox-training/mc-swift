//
//  Comment.swift
//  WBooks
//
//  Created by Megan Cole on 17/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

struct Comment: Codable {
    let id: Int
    let user: User
    let book: Book
    let content: String

    enum CodingKeys: String, CodingKey {
        case id
        case user
        case book
        case content
    }
}
