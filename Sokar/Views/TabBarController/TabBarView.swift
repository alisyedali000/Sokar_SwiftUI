//
//  TabBarView.swift
//  Sokar
//
//  Created by Taimoor Arif on 04/04/2024.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding private var tabSelection : TabTypes
    
    init(tabSelection: Binding<TabTypes>) {
        
        self._tabSelection = tabSelection
        
        UITabBar.appearance().backgroundColor = Color(hex: "#17272A").uiColor
    }
    
    var body: some View {
        
        loadView()
    }
}

extension TabBarView {
    
    func loadView() -> some View {
        
        HStack(spacing: 0) {
            
            Button(action: {
                withAnimation {
                    self.tabSelection = .home
                }
            }, label: {
                TabBarButton(selectedTab: $tabSelection,
                             tab: .home)
            })
            
            Button(action: {
                withAnimation {
                    self.tabSelection = .medication
                }
            }, label: {
                TabBarButton(selectedTab: $tabSelection,
                             tab: .medication)
            })
            
            Button(action: {
                withAnimation {
                    self.tabSelection = .profile
                }
            }, label: {
                TabBarButton(selectedTab: $tabSelection,
                             tab: .profile)
            })
        }
        .background(Color(hex: "#17272A"))
    }
}

#Preview {
    TabBarView(tabSelection: .constant(.home))
}
