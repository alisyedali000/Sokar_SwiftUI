//
//  EmptyStatesView.swift
//  Sokar
//
//  Created by Taimoor Arif on 15/04/2024.
//

import SwiftUI

struct EmptyStatesView: View {
    
    private var image: Image
    private var text: String
    private var width: CGFloat = 158
    private var height: CGFloat = 154
    
    init(image: Image,
         text: String,
         width: CGFloat = 158,
         height: CGFloat = 154) {
        
        self.image = image
        self.text = text
        self.width = width
        self.height = height
    }
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            image
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
            
            Text(text)
                .foregroundStyle(.white)
                .font(.regular(size: 16))
        }
    }
}

#Preview {
    EmptyStatesView(image: ImageName.emptyMedications, text: "No Today's medicine")
}
