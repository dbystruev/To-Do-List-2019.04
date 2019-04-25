//
//  Date+Extension.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale.current
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
