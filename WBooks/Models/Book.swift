//
//  Book.swift
//  WBooks
//
//  Created by Megan Cole on 14/01/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

public struct Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let status: String
    let image: String

    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: BookKey.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        author = try container.decode(String.self, forKey: .author)
        genre = try container.decode(String.self, forKey: .genre)
        year = try container.decode(String.self, forKey: .year)
        status = try container.decode(String.self, forKey: .status)
        image = try container.decode(String.self, forKey: .image)
    }
    
    enum BookKey: String, CodingKey {
        case id
        case title
        case author
        case genre
        case year
        case status
        case image
    }
}

enum BookStatus: String, CaseIterable {
    case available
    case in_your_hands
    case unavailable

    func status_label() -> String {
        switch self {
        case .available:
            return "AVAILABLE_STATUS".localized()
        default:
            return "UNAVAILABLE_STATUS".localized()
        }
    }
}
