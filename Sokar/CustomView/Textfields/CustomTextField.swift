//
//  CustomTextField.swift
//  Koy
//
//  Created by Taimoor Arif on 27/09/2023.
//

import SwiftUI

struct CustomTextField: View {
    
    private var placeholder: String
    private var title: String
    private var image: Image
    private var keyboardType : UIKeyboardType = .default
    @Binding private var text: String
    
    @FocusState private var isFocused: Bool
    
    init(text: Binding<String>,
         title: String,
         placeholder: String,
         image: Image,
         keyboardType : UIKeyboardType = .default) {
        
        self.placeholder = placeholder
        self.image = image
        self.title = title
        self._text = text
        self.keyboardType = keyboardType
    }
    
    var body: some View {
        
        loadView()
    }
}

extension CustomTextField {
    
    func loadView() -> some View {
            
        VStack(alignment: .leading, spacing: 5, content: {
            
            if !(title.isEmpty) {
                
                Text(title)
                    .font(.regular(size: 16))
                    .foregroundStyle(.white)
            }
            
            textfield()
        })
    }
    
    func textfield() -> some View {
        
        ZStack(alignment: .trailing) {
            
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 48)
                .foregroundStyle(Color.white.opacity(0.11))
//                .addShadow
            
            HStack {
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty, placeholder: {
                        Text(placeholder)
                            .foregroundStyle(.gray)
                    })
                    .keyboardType(keyboardType)
                    .focused($isFocused)
                    .font(.regular(size: 12))
                    .tint(Color.accentColor)
                    .foregroundStyle(isFocused ? Color.accentColor : .white)
                    .frame(height: 48)
                    .padding(.leading)
                
                image
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(isFocused ? .accent : .white)
                    .padding(.trailing)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(isFocused ? Color.accentColor : .clear, lineWidth: 1)
                .transition(.opacity)
        )
    }
}

#Preview {
    CustomTextField(text: .constant("258"), title: "Your Name", placeholder: "Enter your number", image: Image(systemName: "eye.fill"), keyboardType: .emailAddress)
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
