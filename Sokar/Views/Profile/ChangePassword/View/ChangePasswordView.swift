//
//  ChangePasswordView.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import SwiftUI

struct ChangePasswordView: View {
    
    private struct Config {
        
        static let screenTitle = "Change Password"
        
        static let oldPass = "Old Password"
        static let oldPassPlchdr = "Enter your old password"
        
        static let newPass = "New Password"
        static let newPassPlchdr = "Enter your new password"
        
        static let retypePass = "Re-Type New Password"
        static let retypePassPlchdr = "Retype your new password"
        
        static let buttonTitle = "Change"
    }
    
    @StateObject private var vm = ChangePasswordVM()
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
    }
}

// MARK: Load View
extension ChangePasswordView {
    
    var loadView: some View {
        
        VStack {
            
            textfields
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {
                
            }
        }
        .topHorizontalPadding
    }
}

// MARK: Textfields
extension ChangePasswordView {
    
    var textfields: some View {
        
        VStack(spacing: 20) {
            
            PasswordTextField(title: Config.oldPass,
                              placeHolder: Config.oldPassPlchdr,
                              text: $vm.oldPassword)
            
            PasswordTextField(title: Config.newPass,
                              placeHolder: Config.newPassPlchdr,
                              text: $vm.newPassword)
            
            PasswordTextField(title: Config.retypePass,
                              placeHolder: Config.retypePassPlchdr,
                              text: $vm.reTypePassword)
        }
    }
}

#Preview {
    ChangePasswordView()
}
