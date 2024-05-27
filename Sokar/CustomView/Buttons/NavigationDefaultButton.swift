//
//  NavigationDefaultButton.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct NavigationDefaultButton<Content>: View where Content : View {
    
    private var title: String
    private var showImage: Bool = false
    private var destination: Content
    
    init(title: String,
         showImage: Bool = false,
         @ViewBuilder destination: () -> Content) {
        
        self.title = title
        self.showImage = showImage
        self.destination = destination()
    }
    
    var body: some View {
        
        NavigationLink {
            destination
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
    NavigationDefaultButton(title: "Hello!") {
        Text("World!")
    }
}
