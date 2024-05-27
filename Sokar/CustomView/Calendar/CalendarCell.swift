//
//  CalendarCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import SwiftUI

struct CalendarCell: View {
    
    private var weekDay: Calendar.WeekDay
    @Binding private var calendarDate: Date
    
    init(weekDay: Calendar.WeekDay, calendarDate: Binding<Date>) {
        self.weekDay = weekDay
        self._calendarDate = calendarDate
    }
    
    var body: some View {
        
        loadView
    }
}

extension CalendarCell {
    
    var loadView: some View {
        
        Group {
            
            let status = Calendar.current.isDate(weekDay.date, inSameDayAs: calendarDate)
            
            VStack(spacing: 6) {
                
                Text(weekDay.string.prefix(2))
                    .font(.light(size: 20))
                    .foregroundStyle(status ? .accent : .white)
                
                Text(weekDay.date.toString("dd"))
                    .foregroundStyle(.black)
                    .font(.light(size: 16))
                    .padding(5)
                    .background {
                        
                        Circle()
                            .foregroundStyle(status ? Color.accentColor : .white)
                    }
            }
            .padding(10)
            .background {
                
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(status ? .white.opacity(0.1): .clear)
            }
            .hAlign(.center)
            .contentShape(Rectangle())
            .onTapGesture {
                
                withAnimation(.easeInOut(duration: 0.3)) {
                    calendarDate = weekDay.date
                }
            }
        }
    }
}

#Preview {
    CalendarCell(weekDay: .init(string: "", date: Date()), calendarDate: .constant(Date()))
}
