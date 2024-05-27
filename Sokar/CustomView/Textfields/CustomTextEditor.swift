//
//  CustomTextEditor.swift
//  myMufti
//
//  Created by Taimoor Arif on 01/03/2023.
//

import SwiftUI

struct CustomTextEditor: View {
    
    private var title: String
    @Binding var text: String
    private var placeholder: String
    private var height: CGFloat
    
    @FocusState var isFocused: Bool
    
    init(title: String,
         text: Binding<String>,
         placeholder: String,
         height: CGFloat) {
        
        self.title = title
        self._text = text
        self.placeholder = placeholder
        self.height = height
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            Text(title)
                .font(.semiBold(size: 14))
                .foregroundStyle(.black)
            
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $text)
                    .font(.regular(size: 12))
                    .frame(height: height)
                    .colorMultiply(Color.white)
                    .keyboardType(.alphabet)
                    .accentColor(.white)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                    .foregroundStyle(.black)
                    .scrollContentBackground(.hidden)
                    .focused($isFocused)
                    .padding(10)
//                    .background(Color.white.cornerRadius(14, corners: .allCorners))
                    .frame(height: height)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isFocused ? .accent : .clear, lineWidth: 1)
                            .transition(.opacity)
                    )
                
                if text.isEmpty {
                    Text(placeholder)
                        .font(.regular(size: 12))
                        .foregroundColor(.gray)
                        .padding(10)
                        .padding(.leading, 3) // to align textfield cursor with text
                        .onTapGesture {
                            
                            self.isFocused = true
                        }
                }
            }
        }
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
        .onDisappear {
            UITextView.appearance().backgroundColor = nil
        }
    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEditor(title: "Bio", text: .constant("ahfhfv"), placeholder: "Please enter description", height: 300)
    }
}
