//
//  DatePickerTextfield.swift
//  Innate
//
//  Created by Taimoor Arif on 14/12/2023.
//

import SwiftUI

struct DatePickerTextfield: View {
    
    private var title: String
    private var text: String
    private var color: Color
    private var alignment: HorizontalAlignment = .center
    private var action: () -> Void
    
    init(title: String,
         text: String,
         color: Color,
         alignment: HorizontalAlignment = .center,
         action: @escaping () -> Void) {
        
        self.title = title
        self.text = text
        self.color = color
        self.alignment = alignment
        self.action = action
    }
    
    var body: some View {
        
        loadView()
    }
}

extension DatePickerTextfield {
    
    func loadView() -> some View {
        
        VStack(alignment: alignment, spacing: 10) {
            
            Text(title)
                .foregroundStyle(.white)
                .font(.medium(size: 19))
            
            Button {
                self.action()
            } label: {
                ZStack {
                 
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.white.opacity(0.10))
                        .frame(height: 48)
                    
                    HStack(spacing: 10) {
                        
                        Image(systemName: "pencil.line")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .fontWeight(.semibold)
                        
                        Text(text)
                            .foregroundStyle(color)
                            .font(.regular(size: 12))
                        
                        Spacer()
                        
                        ImageName.calendar
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                }
            }

        }
    }
}

#Preview {
    DatePickerTextfield(title: "Age", text: "ajsbfj", color: .gray, action: {})
}
