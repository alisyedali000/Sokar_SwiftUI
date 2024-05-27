//
//  SearchTextfield.swift
//  Koy
//
//  Created by Taimoor Arif on 03/10/2023.
//

import SwiftUI

struct SearchTextfield: View {
    
    @Binding private var text: String
    private var placeholder: String
    private var image: Image
    
    init(text: Binding<String>, placeholder: String, image: Image) {
        self._text = text
        self.placeholder = placeholder
        self.image = image
    }
    
    var body: some View {
        
        loadView()
    }
}

extension SearchTextfield {
    
    func loadView() -> some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.white)
                .frame(height: 50)
            
            HStack {
                
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty, placeholder: {
                        Text(placeholder)
                            .foregroundStyle(Color.gray)
                    })
                    .font(.regular(size: 12))
                    .foregroundStyle(.black)
                    .frame(height: 48)
                    
                image
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 14, height: 19)
                    .foregroundStyle(.gray)
            }
            .padding()
        }
    }
}

#Preview {
    SearchTextfield(text: .constant(""), placeholder: "Search", image: Image(systemName: "person.fill"))
}
