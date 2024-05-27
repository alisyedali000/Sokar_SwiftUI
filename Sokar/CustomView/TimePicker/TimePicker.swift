//
//  TimePicker.swift
//  Sokar
//
//  Created by Taimoor Arif on 09/05/2024.
//

import SwiftUI

struct TimePicker: View {
    
    @Binding private var time: Date
    
    init(time: Binding<Date>) {
        
        self._time = time
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load View
extension TimePicker {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack {
           
            topValue
            
            Rectangle()
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 1)
            
            timer
        }
        .background {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
    
    @ViewBuilder
    var topValue: some View {
        
        HStack {
            
            Text("Time")
                .foregroundStyle(.white)
                .font(.medium(size: 15))
            
            Spacer()
            
            Text("\(time.toString("hh:mm a"))")
                .font(.regular(size: 14))
                .foregroundStyle(.accent)
        }
        .padding([.horizontal, .top])
    }
    
    @ViewBuilder
    var timer: some View {
        
        HStack {
            
            DatePicker("", selection: $time, displayedComponents: [.hourAndMinute])
                .preferredColorScheme(.dark)
                .datePickerStyle(.wheel)
                .tint(.accent)
        }
        .padding(.horizontal)
    }
}

#Preview {
    TimePicker(time: .constant(Date()))
}
