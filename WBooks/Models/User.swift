//
//  User.swift
//  WBooks
//
//  Created by Megan Cole on 13/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

struct User: Codable {
    let id: Int
    let username: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case avatar = "image"
    }
}
