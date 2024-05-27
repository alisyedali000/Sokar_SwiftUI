//
//  LoaderView.swift
//  Innate
//
//  Created by Taimoor Arif on 21/12/2023.
//

import SwiftUI

struct LoaderView: View {
    
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

extension LoaderView {
    
    func loader() -> some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.gray.opacity(0.6))
                .frame(width: 100, height: 100)
            
            ProgressView()
                .scaleEffect(1.3)
                .tint(.accent)
        }
    }
}

#Preview {
    LoaderView(showLoader: .constant(true))
}
