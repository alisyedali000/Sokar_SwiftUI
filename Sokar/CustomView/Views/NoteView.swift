//
//  NoteView.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/04/2024.
//

import SwiftUI

struct NoteView: View {
    
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        
        HStack {
            
            Group {
                
                Text("Note: ")
                    .font(.medium(size: 14))
                +
                Text(text)
                    .font(.regular(size: 12))
            }
            .foregroundStyle(.white.opacity(0.7))
            
            Spacer(minLength: 0.01)
        }
        .showFullText
    }
}

#Preview {
    NoteView(text: "This is the detailed text")
}
