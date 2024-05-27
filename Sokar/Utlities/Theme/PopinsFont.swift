//
//  PopinsFont.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 24/03/2024.
//

import Foundation
import SwiftUI


enum FontName: String {
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
    case bold = "Poppins-Bold"
}

enum SokarFont: Int {
    case regular = 400
    case medium = 500
    case semiBold = 600
    case bold = 700
    
    private func fontName() -> String {
        switch self {
        case .regular:
            return FontName.regular.rawValue
        case .medium:
            return FontName.medium.rawValue
        case .semiBold:
            return FontName.semiBold.rawValue
        case .bold:
            return FontName.bold.rawValue
        }
    }
    
    func getFont(size: FontSize) -> Font {
        return Font.custom(fontName(), size: size.rawValue)
    }
}

enum FontSize: CGFloat {
    case h0 = 10
    case h1 = 12
    case h2 = 14
    case h3 = 16
    case h4 = 20
    case h5 = 28
    case h6 = 36
    
    var size: CGFloat {
        phoneFontSize
    }
    
    private var phoneFontSize: CGFloat {
        switch self {
        case .h0:
            return 10.0
        case .h1:
            return 12.0
        case .h2:
            return 14.0
        case .h3:
            return 16
        case .h4:
            return 18
        case .h5:
            return 24
        case .h6:
            return 36
        }
    }
}

extension Font {
    
    static func bold(size: CGFloat) -> Font {
        self.custom("Poppins-Bold", size: size)
    }
    
    static func semiBold(size: CGFloat) -> Font {
        self.custom("Poppins-SemiBold", size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
        self.custom("Poppins-Medium", size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        self.custom("Poppins-Regular", size: size)
    }
    
    static func light(size: CGFloat) -> Font {
        self.custom("Poppins-Light", size: size)
    }
}
