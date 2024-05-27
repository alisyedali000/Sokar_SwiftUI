//
//  TabBarEnums.swift
//  Sokar
//
//  Created by Taimoor Arif on 05/04/2024.
//

import Foundation
import SwiftUI

enum TabTypes {
    
    case home
//    case meal
    case medication
    case profile
}

extension TabTypes {
    
    var selectedImage: Image {
        
        switch self {
            
        case .home:
            
            ImageName.homeBlue
            
//        case .meal:
//            
//            ImageName.mealBlue
            
        case .medication:
            
            ImageName.medicationBlue
            
        case .profile:
            
            ImageName.profileBlue
        }
    }
    
    var unselectedImage: Image {
        
        switch self {
            
        case .home:
            
            ImageName.homeGray
            
//        case .meal:
//            
//            ImageName.mealGray
            
        case .medication:
            
            ImageName.medicationGray
            
        case .profile:
            
            ImageName.profileGray
        }
    }
}
