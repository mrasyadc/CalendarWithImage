//
//  Session.swift
//  Calendar
//
//  Created by Muhammad Rasyad Caesarardhi on 14/07/24.
//

import Foundation

struct Session: Identifiable {
    var id: String
    var startDate: Date
    var endDate: Date
    var points: Int

    // MARK: - Show Date as Text

    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter
    }()

    // MARK: - Show start and end times as Text

    static var dailyTimeFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
}
