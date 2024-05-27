//
//  SelectionIndicator.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 25/03/2024.
//

import SwiftUI


struct SelectionIndicator: View {
    var selectedWidth = 32.0
    var unselectedWidth = 16.0
    var selectedIndex: Int
    
    
    var body: some View {
        loadView
    }
}

// UIView extension
extension SelectionIndicator {
    var loadView: some View {
        HStack(spacing: 8) {
            ForEach(0..<4) { i in
                Rectangle()
                    .frame(width: getWidth(currentIndex: i), height: 2.5)
                    .foregroundColor(getColor(currentIndex: i))
            }
        }
    }
}

// MARK: - Custom function extension
extension SelectionIndicator {
    func getWidth(currentIndex: Int) -> CGFloat {
        return selectedIndex == currentIndex ? CGFloat(selectedWidth) : CGFloat(unselectedWidth)
    }
    
    func getColor(currentIndex: Int) -> Color {
        return selectedIndex == currentIndex ? Color.blue : Color.white
    }
}

#Preview {
    ZStack {
        AppBG()
        SelectionIndicator(selectedIndex: 0)
    }
    
}
