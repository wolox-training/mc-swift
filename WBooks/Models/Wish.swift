//
//  Wish.swift
//  WBooks
//
//  Created by Megan Cole on 13/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

struct Wish: Codable {
    let id: Int
    let user: User
    let book: Book

    enum CodingKeys: String, CodingKey {
        case id
        case user
        case book
    }
}
