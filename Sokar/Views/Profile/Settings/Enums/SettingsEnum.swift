//
//  SettingsEnum.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import Foundation
import SwiftUI

enum SettingsEnum {
    
    case editProfile
    case changePassword
    case diabeticType
    case foodPreference
    case subscription
    case addParent
    case addChild
    case privacyPolicy
    case termsConditions
    case deleteAccount
}

extension SettingsEnum {
    
    var title: String {
        
        switch self {
            
        case .editProfile:
            
            return "Edit Profile"
            
        case .changePassword:
            
            return "Change Password"
            
        case .diabeticType:
            
            return "Change Diabetic Type"
            
        case .foodPreference:
            
            return "Change Food Preference"
            
        case .subscription:
            
            return "Subscription Plan"
            
        case .addParent:
            
            return "Add Parent/User/Doctor"
            
        case .addChild:
            
            return "Add Child"
            
        case .privacyPolicy:
            
            return "Privacy Policy"
            
        case .termsConditions:
            
            return "Terms and Conditions"
            
        case .deleteAccount:
            
            return "Delete Account"
        }
    }
    
    var image: Image {
        
        switch self {
            
        case .editProfile:
            
            return Image(systemName: "person.fill")
            
        case .changePassword:
            
            return ImageName.lock
            
        case .diabeticType:
            
            return ImageName.diabeticGreen
            
        case .foodPreference:
            
            return ImageName.mealBlue
            
        case .subscription:
            
            return ImageName.subscription
            
        case .addParent:
            
            return Image(systemName: "person.circle.fill")
            
        case .addChild:
            
            return ImageName.addChild
            
        case .privacyPolicy:
            
            return ImageName.privacyPolicy
            
        case .termsConditions:
            
            return ImageName.termsConditions
            
        case .deleteAccount:
            
            return Image(systemName: "trash.fill")
        }
    }
}
