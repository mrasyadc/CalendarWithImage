//
//  Achievement.swift
//  Calendar
//
//  Created by Muhammad Rasyad Caesarardhi on 14/07/24.
//

import Foundation

struct Achievements {
    var requiredPoints = 100
    var startDate: Date = getDateFromString("2024-01-01 08:00:00")!
    var sessions: [Session]

    // MARK: - Sample set of Sessions with points and duration

    static var sampleDataset = Achievements(
        sessions: [
            // Success
            Session(
                id: UUID().uuidString,
                startDate: getDateFromString("2024-07-12 08:00:00")!,
                endDate: getDateFromString("2024-07-14 09:04:00")!,
                points: 100
            ),
            // Fail
            Session(
                id: UUID().uuidString,
                startDate: getDateFromString("2024-02-24 12:00:00")!,
                endDate: getDateFromString("2024-02-24 01:15:20")!,
                points: 30
            ),
            // Success because combined points of 2 Sessions in same day
            Session(
                id: UUID().uuidString,
                startDate: getDateFromString("2024-02-25 06:30:00")!,
                endDate: getDateFromString("2024-02-25 09:50:42")!,
                points: 80
            ),
            Session(
                id: UUID().uuidString,
                startDate: getDateFromString("2024-02-25 03:12:00")!,
                endDate: getDateFromString("2024-02-25 04:04:07")!,
                points: 20
            ),
            // Success
            Session(
                id: UUID().uuidString,
                startDate: getDateFromString("2024-02-26 09:00:00")!,
                endDate: getDateFromString("2024-02-26 10:00:00")!,
                points: 120
            )
        ]
    )

    // MARK: - To get sample Dates

    static func getDateFromString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: dateString) else {
            return nil
        }

        return date
    }

    // MARK: - Get total points on a Date

    func totalPoints(on date: Date) -> Int {
        var totalPoints = 0
        // only add points from Sessions that occur within same day as the given date
        for session in self.sessions {
            if Calendar.current.compare(date, to: session.startDate, toGranularity: .day) == .orderedSame {
                totalPoints += session.points
            }
        }
        return totalPoints
    }
}
