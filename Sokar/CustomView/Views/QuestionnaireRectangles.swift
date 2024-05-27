//
//  QuestionnaireRectangles.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct QuestionnaireRectangles: View {
    
    private var tabSelection: Int
    
    init(tabSelection: Int) {
        self.tabSelection = tabSelection
    }
    
    var body: some View {
        
        HStack {
        
            rectangleView(color: tabSelection >= 1 ? .accent : .white)
            
            rectangleView(color: tabSelection >= 2 ? .accent : .white)
            
            rectangleView(color: tabSelection >= 3 ? .accent : .white)
            
            rectangleView(color: tabSelection >= 4 ? .accent : .white)
            
            rectangleView(color: tabSelection >= 5 ? .accent : .white)
        }
    }
}

extension QuestionnaireRectangles {
    
    func rectangleView(color: Color) -> some View {
        
        Rectangle()
            .frame(width: 16, height: 3)
            .foregroundStyle(color)
    }
}

#Preview {
    QuestionnaireRectangles(tabSelection: 3)
}
