//
//  CalendarView.swift
//  Sokar
//
//  Created by Taimoor Arif on 22/04/2024.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding private var calendarDate: Date
    
    init(calendarDate: Binding<Date>) {
        
        self._calendarDate = calendarDate
    }
    
    var body: some View {
        
        loadView
    }
}

extension CalendarView {
    
    var loadView: some View {
        
        VStack {
            
            Text(calendarDate.toString("MMM YYYY"))
                .hAlign(.leading)
                .font(.medium(size: 16))
            
            weekRow
        }
    }
}

extension CalendarView {
    
    var weekRow: some View {
        
        HStack(spacing: 0) {
            
            ForEach(Calendar.current.currentWeek(from: calendarDate)) { weekDay in
                
                CalendarCell(weekDay: weekDay,
                             calendarDate: $calendarDate)
            }
        }
        .padding(.horizontal, -15)
    }
}

#Preview {
    CalendarView(calendarDate: .constant(Date()))
}
