//
//  TabBarButton.swift
//  Sokar
//
//  Created by Taimoor Arif on 05/04/2024.
//

import SwiftUI

struct TabBarButton: View {
    
    @Binding var selectedTab: TabTypes
    private var tab: TabTypes
    
    init(selectedTab: Binding<TabTypes>, tab: TabTypes) {
        
        self._selectedTab = selectedTab
        self.tab = tab
    }
    
    var body: some View {
        
        // for getting mid point of each button for curve animation
        
        GeometryReader { reader in
                
                VStack(spacing: 3) {
                    
                    let currentTabIsSelected = selectedTab == tab ? true : false
                    
                    let image = currentTabIsSelected ? tab.selectedImage : tab.unselectedImage
                    
                    image
                    // lifting view if it is selected
                        .offset(y: selectedTab == tab ? -10 : 0)
                    
                    if currentTabIsSelected {
                        
                        Circle()
                            .fill(.accent)
                            .frame(width: 6, height: 6)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 70)
    }
}

#Preview {
    TabBarButton(selectedTab: .constant(.home), tab: .home)
}
