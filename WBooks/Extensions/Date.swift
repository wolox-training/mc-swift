//
//  Date.swift
//  WBooks
//
//  Created by Megan Cole on 19/03/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import UIKit

extension Date {
    static func formattedDate(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
