//
//  MessageLoader.swift
//  Innate
//
//  Created by Taimoor Arif on 31/01/2024.
//

import SwiftUI

struct MessageLoader: View {
    
    @Binding private var showLoader: Bool
    
    init(showLoader: Binding<Bool>) {
        
        self._showLoader = showLoader
    }
    
    var body: some View {
        
        Group {
            
            if showLoader {
                
                ZStack {
                    
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    
                    loader()
                }
            }
        }
    }
}

extension MessageLoader {
    
    func loader() -> some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.gray.opacity(0.6))
                .frame(width: 150, height: 120)
            
            VStack(spacing: 10) {
                
                ProgressView()
                    .scaleEffect(1.3)
                    .tint(.accent)
                
                Text("Creating PDF")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    MessageLoader(showLoader: .constant(true))
}
