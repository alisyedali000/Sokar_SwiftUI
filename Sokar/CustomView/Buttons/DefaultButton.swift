//
//  DefaultButton.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 26/03/2024.
//

import SwiftUI

struct DefaultButton: View {
    
    private var title: String
    private var showImage: Bool = false
    private var action : () -> Void
    
    init(title: String, showImage: Bool = false, action: @escaping () -> Void) {
        
        self.title = title
        self.showImage = showImage
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.accent)
                    .frame(height: 56)
                
                HStack {
                    
                    Text(title)
                        .foregroundColor(.black)
                        .font(.medium(size: 14))
                    
                    if showImage {
                        
                        HStack(spacing: 0) {
                            
                            chevronImage(color: .black.opacity(0.5))
                            chevronImage(color: .black)
                        }
                    }
                }
            }
        }
    }
    
    func chevronImage(color: Color) -> some View {
        
        Image(systemName: "chevron.right")
            .resizable()
            .scaledToFit()
            .frame(width: 10, height: 8)
            .foregroundStyle(color)
    }
}

#Preview {
    DefaultButton(title: "SignUp", showImage: true, action: {
        print("")
    })
}
