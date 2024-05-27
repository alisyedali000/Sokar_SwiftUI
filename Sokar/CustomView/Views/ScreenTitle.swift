//
//  ScreenTitle.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct ScreenTitle: View {
    
    private var title: String
    private var description: String
    private var showAppName: Bool
    private var titleFont: Font = .regular(size:23)
    private var descriptionFont: Font = .light(size: 14)
    
    init(title: String,
         description: String,
         showAppName: Bool = false,
         titleFont: Font = .regular(size:23),
         descriptionFont: Font = .light(size: 14)) {
        
        self.title = title
        self.description = description
        self.showAppName = showAppName
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
    }
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            Text(title)
                .foregroundStyle(.white)
                .font(titleFont)
                .multilineTextAlignment(.center)
            
            VStack {
                
                Text(description)
                    .font(descriptionFont)
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                
                if showAppName {
                    
                    Text("SOKAR")
                        .font(.light(size: 14))
                        .foregroundStyle(.accent)
                }
            }
        }
    }
}

#Preview {
    ScreenTitle(title: "Title", description: "This is the description", showAppName: true)
}
