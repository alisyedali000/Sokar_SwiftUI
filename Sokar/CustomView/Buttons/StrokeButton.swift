//
//  StrokeButton.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct StrokeButton: View {
    
    private var title: String
    private var action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        
        loadView
            .padding(.vertical)
    }
}

extension StrokeButton {
    
    var loadView: some View {
        
        Button {
            self.action()
        } label: {
            
            HStack {
             
                Spacer()
                
                Image(systemName: "plus.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.accent)
                
                Text(title)
                    .font(.regular(size: 16))
                    .foregroundStyle(.accent)
                
                Spacer()
            }
            .overlay {
                
                RoundedRectangle(cornerRadius: 14)
                    .stroke(.accent, lineWidth: 1.0)
                    .frame(height: 48)
            }
        }
    }
}

#Preview {
    StrokeButton(title: "Add More", action: {})
}
