//
//  ActionableTextfield.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct ActionableTextfield: View {
    
    private var title: String
    private var image: Image
    private var text: String
    private var action: () -> Void
    
    init(title: String,
         image: Image,
         text: String,
         action: @escaping () -> Void) {
        
        self.title = title
        self.image = image
        self.text = text
        self.action = action
    }
    
    var body: some View {
        
        loadView()
    }
}

extension ActionableTextfield {
    
    func loadView() -> some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .foregroundStyle(.white)
                .font(.regular(size: 16))
            
            Button(action: {
                self.action()
            }, label: {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.white.opacity(0.1))
                        .frame(height: 48)
                    
                    textView
                }
            })
        }
    }
    
    var textView: some View {
        
        HStack {
            
            image
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text(text)
                .foregroundStyle(.white)
                .font(.light(size: 13))
                .lineLimit(1)
        }
    }
}

#Preview {
    ActionableTextfield(title: "Frequency", image: ImageName.pencilFill, text: "Remind Me", action: {})
}
