//
//  ContentView.swift
//  Calendar
//
//  Created by Muhammad Rasyad Caesarardhi on 14/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var myAchievements = Achievements.sampleDataset
    @State private var selectedDate: Date = .init()

    var body: some View {
        ScrollView {
            VStack {
                FSCalendarView(selectedDate: $selectedDate, achievements: $myAchievements)
                    .frame(height: 500)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
