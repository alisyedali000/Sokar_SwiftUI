//
//  OTPTextfield.swift
//  Koy
//
//  Created by Taimoor Arif on 28/09/2023.
//

import SwiftUI

struct OTPTextfield: View {
    
    @Binding var otpText: String
    @FocusState var isKeyboardShowing: Bool
    var maxBoxes: Int = 4
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            ForEach(0..<maxBoxes, id: \.self) { index in
               
                OTPTextBox(index)
            }
        }
        .background(content: {
            TextField("", text: $otpText.limit(6))
                .keyboardType(.numberPad)
                .foregroundStyle(.white)
//                .textContentType(.oneTimeCode)
            /// hide textfield
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
                
        })
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        .padding()
    }
}

extension OTPTextfield {
    
    func OTPTextBox(_ index: Int) -> some View {
        
        ZStack {
            if otpText.count > index {
                
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = "\(otpText[charIndex])"
                Text(charToString)
                    .foregroundStyle(.accent)
                
            } else {
                
                Text(" ")
            }
        }
        .frame(width: 40, height: 40)
        .background {
            
            let status = (isKeyboardShowing && otpText.count == index)
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white.opacity(0.1))
                .animation(.easeInOut(duration: 0.2), value: status)
                .overlay {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(status ? .accent : .gray.opacity(0.5), lineWidth: status ? 1 : 0.5)
                }
        }
    }
}

#Preview {
    OTPTextfield(otpText: .constant("012154"))
}

extension Binding where Value == String {
    
    func limit(_ length : Int) -> Self {
        if self.wrappedValue.count > length {
            
            DispatchQueue.main.async {
                self.wrappedValue = "\(self.wrappedValue.prefix(length))"
            }
        }
        
        return self
    }
}
