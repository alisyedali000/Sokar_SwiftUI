//
//  OnBoardingView.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 24/03/2024.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State private var activeTab = 1
    
    var body: some View {
        
        loadView
            .addBackground
    }
}

extension OnBoardingView {
    var loadView: some View {
        TabView(selection: $activeTab,
                content:  {
        
            PageOne()
                .tag(1)
            PageTwo(tab: $activeTab)
                .tag(2)
            PageThree(tab: $activeTab)
                .tag(3)
            PageFour(tab: $activeTab)
                .tag(4)
        })
        .tabViewStyle(.page(indexDisplayMode: .never))

    }
}

#Preview {
    OnBoardingView()
}
