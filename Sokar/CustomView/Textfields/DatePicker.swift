//
//  DatePickerMLB.swift
//  myMufti
//
//  Created by Qazi Ammar Arshad on 04/07/2022.
//

import SwiftUI

struct AgePickerMLB: View {

    @State private var date = addOrSubtractYear(year: -18)
    @Binding var showDatePicker: Bool
    var action: (Date) -> Void

    init(showDatePicker: Binding<Bool>,
         action: @escaping (Date) -> Void) {
        
        self._showDatePicker = showDatePicker
        self.action = action
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white.opacity(0.2)
                .ignoresSafeArea()
                .onTapGesture {
                    self.showDatePicker = false
                }
            
            VStack(spacing: 0) {
                DatePicker("", selection: $date, in: ...addOrSubtractYear(year: -18), displayedComponents: [.date])
                    .preferredColorScheme(.dark)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .tint(.accent)
                    .padding(10)
                    .background(
                        Color.calendarBackground
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                    )
                
                /// bottom ok, cancel button view
                ZStack(alignment: .topTrailing) {
                    
                    Rectangle()
                        .frame(height: 45)
                        .foregroundStyle(Color.calendarBackground)
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    
                    HStack {
                        Button {
                            self.action(date)
                            withAnimation {
                                showDatePicker = false
                            }
                        } label: {
                            Text("OK")
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding()
                        Button {
                            withAnimation {
                                showDatePicker = false
                            }
                        } label: {
                            Text("Cancel")
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding(.trailing)
                        .padding()
                    }
                    .padding(-10)
                }
                
            }
            .padding()
            
        }
    }
}

struct DatePickerMLB: View {

    @State private var date = Date()
    
    @Binding var showDatePicker: Bool
    private var displayComponents: DatePickerComponents = [.date]
    private var action: (Date) -> Void

    init(showDatePicker: Binding<Bool>,
         displayComponents: DatePickerComponents = [.date],
         action: @escaping (Date) -> Void) {
        
        self._showDatePicker = showDatePicker
        self.displayComponents = displayComponents
        self.action = action
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white.opacity(0.2)
                .ignoresSafeArea()
                .onTapGesture {
                    self.showDatePicker = false
                }
            
            VStack(spacing: 0) {
                DatePicker("", selection: $date, displayedComponents: displayComponents)
                    .preferredColorScheme(.dark)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .tint(.accent)
                    .padding(10)
                    .background(
                        Color.calendarBackground
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                    )
                
                /// bottom ok, cancel button view
                ZStack(alignment: .topTrailing) {
                    
                    Rectangle()
                        .frame(height: 45)
                        .foregroundStyle(Color.calendarBackground)
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    
                    HStack {
                        Button {
                            self.action(date)
                            withAnimation {
                                showDatePicker = false
                            }
                        } label: {
                            Text("OK")
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding()
                        Button {
                            withAnimation {
                                showDatePicker = false
                            }
                        } label: {
                            Text("Cancel")
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding(.trailing)
                        .padding()
                    }
                    .padding(-10)
                }
                
            }
            .padding()
            
        }
    }
}

#Preview {
    DatePickerMLB(showDatePicker: .constant(false)) { data in
       debugPrint(data)
    }
}

func addOrSubtractYear(year:Int) -> Date {
  return Calendar.current.date(byAdding: .year, value: year, to: Date())!
}
