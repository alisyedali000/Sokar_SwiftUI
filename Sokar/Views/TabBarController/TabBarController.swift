//
//  TabBarController.swift
//  Sokar
//
//  Created by Taimoor Arif on 05/04/2024.
//

import SwiftUI

struct TabBarController: View {
    
    @State private var tabSelection: TabTypes = .home
    
    var body: some View {
        
        loadView()
    }
}

extension TabBarController {
    
    func loadView() -> some View {
        
        ZStack(alignment: .bottom) {
            
            tabViews()
            
            TabBarView(tabSelection: $tabSelection)
        }
    }
    
    func tabViews() -> some View {
        
        Group {
            
            switch tabSelection {
                
            case .home:
                
                HomeView()
                
            case .medication:
                
                MedicationReminderView()
                
            case .profile:
                
                ProfileView()
            }
        }
    }
}

#Preview {
    TabBarController()
}
