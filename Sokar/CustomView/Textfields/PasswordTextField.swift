//
//  PasswordTextField.swift
//  Unified
//
//  Created by Qazi Ammar Arshad on 07/07/2022.
//

import SwiftUI

struct PasswordTextField: View {
    
    @State private var isSecure = true
    
    private var title: String
    private var placeHolder: String
    @Binding private var text: String
    
    @FocusState private var secureFocused: Bool
    @FocusState private var normalFocused: Bool

    init(title: String, placeHolder: String, text: Binding<String>) {
        
        self.title = title
        self.placeHolder = placeHolder
        self._text = text
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5, content: {
            
            if !(title.isEmpty) {
                
                Text(title)
                    .font(.medium(size: 14))
            }
            
            textfield()
        })
        .onAppear(perform: {
            self.secureFocused = false
            self.normalFocused = false
        })
    }
    
    func textfield() -> some View {
        
        ZStack(alignment: .trailing) {
            
            Group {
                isSecure ? AnyView(secureTF()) : AnyView( normalTF())
            }
            
            Button {
                
                
                withAnimation {
                    
                    isSecure.toggle()
                }
                
                if isSecure {
                    secureFocused = true
                } else {
                    normalFocused = true
                }
                
            } label: {
                
                let image = isSecure ? Image(systemName: "eye.fill") : Image(systemName: "eye.slash.fill")
                
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 13)
                    .foregroundStyle(Color.white)
                    .padding(.trailing)
            }
        }
    }
    
    func secureTF() -> some View {
        
        VStack {
            
            let isFocused = secureFocused == true || normalFocused == true ? true : false
            
            SecureField(placeHolder, text: $text)
                .font(.regular(size: 12))
                .focused($secureFocused)
                .padding(15)
                .tint(Color.accentColor)
                .foregroundStyle(isFocused ? Color.accentColor : .white)
                .cornerRadius(12)
                .frame(height: 48)
                .background(content: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color.white.opacity(0.11))
                })
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(isFocused ? Color.accentColor : .clear, lineWidth: 1)
                        .transition(.opacity)
                )
        }
    }
    
    func normalTF() -> some View {
        
        VStack {
            
            let isFocused = secureFocused == true || normalFocused == true ? true : false
            
            TextField(placeHolder, text: $text)
                .font(.regular(size: 12))
                .padding(15)
                .focused($normalFocused)
                .tint(Color.accentColor)
                .foregroundStyle(isFocused ? Color.accentColor : .white)
                .cornerRadius(12)
                .frame(height: 48)
                .background(content: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color.white.opacity(0.11))
                })
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(isFocused ? Color.accentColor : .clear, lineWidth: 1)
                        .transition(.opacity)
                )
        }
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField(title: "Name", placeHolder: "password", text: .constant("123"))
    }
}
