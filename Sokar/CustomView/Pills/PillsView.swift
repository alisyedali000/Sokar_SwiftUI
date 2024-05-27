//
//  PillsView.swift
//  Sokar
//
//  Created by Taimoor Arif on 15/04/2024.
//

import SwiftUI

struct PillsView: View {
    
    private struct Config {
        
        static var title = "Pills"
    }
    
    private var type: PillType
    private var value: Double
    
    init(type: PillType, value: Double) {
        
        self.type = type
        self.value = value
    }
    
    var body: some View {
        
        loadView()
    }
}

extension PillsView {
    
    func loadView() -> some View {
        
        ZStack {
          
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 105)
            
            data
        }
    }
    
    var data: some View {
        
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                
                Text(Config.title)
                    .foregroundStyle(.white)
                    .font(.regular(size: 17))
                
                let valueText = String(value).components(separatedBy: ".")
                
                Text(valueText.first ?? "")
                    .foregroundStyle(.accent)
                    .font(.regular(size: 30))
                    .contentTransition(.numericText(value: Double(value)))
                
                Text(type.title)
                    .foregroundStyle(.white.opacity(0.6))
                    .font(.regular(size: 11))
            }
            .padding(.leading, 15)
            
            Spacer()
            
            type.image
                .resizable()
                .scaledToFit()
                .frame(width: type.width, height: type.height)
                .padding(.trailing, 23)
                .padding(.top)
        }
    }
}

#Preview {
    PillsView(type: .tick, value: 2)
}

enum PillType {
    
    case tick
    case cross
}

extension PillType {
    
    var title: String {
        
        switch self {
            
        case .tick:
            
            return "Taken"
            
        case .cross:
            
            return "Remaining"
        }
    }
    
    var image : Image {
        
        switch self {
            
        case .tick:
            
            ImageName.tick
            
        case .cross:
            
            ImageName.cross
        }
    }
    
    var width: CGFloat {
        
        switch self {
            
        case .tick:
            
            return 23
            
        case .cross:
            
            return 17
        }
    }
    
    var height: CGFloat {
        
        switch self {
            
        case .tick:
            
            return 20
            
        case .cross:
            
            return 20
        }
    }
}
