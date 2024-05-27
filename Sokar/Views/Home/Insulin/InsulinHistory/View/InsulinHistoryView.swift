//
//  InsulinHistoryView.swift
//  Sokar
//
//  Created by Taimoor Arif on 10/05/2024.
//

import SwiftUI

struct InsulinHistoryView: View {
    
    private struct Config {
        
        static let screenTitle = "Insulin History"
        
        static let insulinTitle = "Insulin Units"
        
        static let emptyMedicines = "No Today's Medicines"
    }
    
    @StateObject private var vm = InsulinHistoryVM()
    
    @State private var openCalendar = false
    
    var body: some View {
        
        ZStack {
            
            loadView
            
            if openCalendar {
                
                DatePickerMLB(showDatePicker: $openCalendar) { date in
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        
                        vm.selectedDate = date
                    }
                }
            }
        }
        .addBackground
        .addNavigationTitle(title: Config.screenTitle)
        .toolbar(content: {
            
            toolBarButton
        })
    }
}

// MARK: Load View
extension InsulinHistoryView {
    
    var loadView: some View {
        
        VStack {
            
            calendarView
            
            insulinView
            
            Spacer()
        }
        .topHorizontalPadding
    }
}

// MARK: SubViews
extension InsulinHistoryView {
    
    var calendarView: some View {
        
        VStack {
           
            CalendarView(calendarDate: $vm.selectedDate)
        }
    }
    
    var insulinView: some View {
        
        VStack(spacing: 15) {
            
            SeparatorLine()
            
            totalUnits
            
            ForEach(vm.insulinArray) { insulin in
                
                InsulinCell(insulin: insulin)
            }
        }
    }
    
    @ViewBuilder
    var totalUnits: some View {
        
        HStack {
            
            Text(Config.insulinTitle)
                .font(.medium(size: 20))
                .foregroundStyle(.white)
            
            Spacer()
            
            Text("\(vm.getTotalInsulinUnits()) units Total")
                .font(.light(size: 14))
                .foregroundStyle(.white.opacity(0.7))
        }
    }
}

// MARK: Tool bar button
extension InsulinHistoryView {
    
    @ViewBuilder
    var toolBarButton: some View {

        Button {
            self.openCalendar.toggle()
        } label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 11)
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.white.opacity(0.1))
                
                ImageName.calendar
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
        }
    }
}

#Preview {
    InsulinHistoryView()
}
