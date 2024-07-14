//
//  FSCalendarView.swift
//  Calendar
//
//  Created by Muhammad Rasyad Caesarardhi on 14/07/24.
//

import FSCalendar
import SwiftUI

struct FSCalendarView: UIViewRepresentable {
    @Binding var selectedDate: Date
    @Binding var achievements: Achievements
        
    func makeCoordinator() -> Coordinator {
        Coordinator(self, achievements: achievements)
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.appearance.selectionColor = .systemPurple
        // Remove today circle
        calendar.today = nil
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        // update the calendar view if necessary
    }
    
    // MARK: - Coordinator

    class Coordinator: NSObject, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
        var parent: FSCalendarView
        
        var achievements: Achievements
        
        init(_ calender: FSCalendarView, achievements: Achievements) {
            self.parent = calender
            self.achievements = achievements
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }
        
        func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
            if date.compare(Date()).rawValue >= 0 {
                return UIImage(resource: .emoAnxiety)
            }
            return nil
        }
        
        // Need reload to have fill colors display correctly after calendar page changes
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            calendar.reloadData()
        }
        
        // MARK: - Other

        func isDateInMonth(date: Date, targetMonth: Date) -> Bool {
            return Calendar.current.isDate(date, equalTo: targetMonth, toGranularity: .month)
        }
        
        func isOnOrAfterAchievementStartDate(date: Date) -> Bool {
            return date >= achievements.startDate || Calendar.current.isDate(date, equalTo: achievements.startDate, toGranularity: .day)
        }
    }
}
