//
//  DropdownTextField.swift
//  Innate
//
//  Created by Taimoor Arif on 04/12/2023.
//

import SwiftUI

struct DropdownTextField: View {
    
    private var text: String
    private var textColor: Color
    private var backgroundColor: Color = .white
    
    init(text: String, textColor: Color, backgroundColor: Color = .white) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        
        loadView()
    }
}

extension DropdownTextField {
    
    func loadView() -> some View {
        
        ZStack {
         
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(backgroundColor)
                .frame(height: 50)
            
            HStack {
                
                Text(text)
                    .foregroundStyle(textColor)
                    .font(.regular(size: 12))
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 6)
                    .fontWeight(.semibold)
                    .foregroundStyle(textColor)
            }
            .padding()
        }
    }
}

#Preview {
    DropdownTextField(text: "State", textColor: .black)
}
