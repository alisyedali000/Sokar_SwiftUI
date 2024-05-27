//
//  CalendarExtension.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import Foundation

// MARK: Calendar Extension
extension Calendar {
    
    func currentWeek(from date: Date) -> [WeekDay] {
    
        guard let firstWeekDay = self.dateInterval(of: .weekOfMonth, for: date)?.start else { return [] }
        
        var week: [WeekDay] = []
        
        for index in 0..<7 {
            
            if let day = self.date(byAdding: .day, value: index, to: firstWeekDay) {
                
                let weekDaySymbol = day.toString("EEEE")

                week.append(.init(string: weekDaySymbol, date: day))
            }
        }
        
        return week
    }
    
    struct WeekDay: Identifiable {
        
        var id = UUID().uuidString
        var string: String
        var date: Date
        var isToday: Bool = false
    }
}
