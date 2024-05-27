//
//  ResendPassword.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct ResendPasswordView: View {
    
    private struct Config {
        
        static let topTitle = "Resend Password"
        static let topDescription = "Enter your new password so that you can access your account"
        
        static let passwordTitle = "New Password"
        static let passwordPlaceholder = "Enter your password"
        
        static let retypePassTitle = "Re-Type New Password"
        static let retypePassPlaceholder = "Re-type your password"
        
        static let bottomBtnTitle = "Change Password"
    }
    
    @StateObject private var vm = ResendPasswordVM()
    
    @Binding private var moveBackToLogin: Bool
    private var userId: Int
    
    init(moveBackToLogin: Binding<Bool>, userID: Int) {
        
        self._moveBackToLogin = moveBackToLogin
        self.userId = userID
    }
    
    var body: some View {
        
        ZStack {
            
            loadView()
            
            LoaderView(showLoader: $vm.showLoader)
        }
        .addBackground
        .navigationTitle("")
        .alert(vm.errorMessage, isPresented: $vm.showError, actions: {})
        .alert(vm.resetPassDoneAlert, isPresented: $vm.resetPassDone) {
            
            Button("Ok", role: .cancel) {
                self.moveBackToLogin = false
            }
        }
    }
}

extension ResendPasswordView {
    
    func loadView() -> some View {
    
        VStack(spacing: 40) {
            
            ScreenTitle(title: Config.topTitle,
                        description: Config.topDescription)
            
            textfields()
            
            Spacer()
            
            DefaultButton(title: Config.bottomBtnTitle) {
                vm.resetPassDoneAlert = "Password changed succesfully"
                vm.resetPassDone.toggle()
            }
        }
        .padding(.horizontal)
        .padding(.top, 50)
    }
}

extension ResendPasswordView {
    
    func textfields() -> some View {
        
        VStack(spacing: 15) {
            
            PasswordTextField(title: Config.passwordTitle,
                              placeHolder: Config.passwordTitle,
                              text: $vm.newPassword)
            
            PasswordTextField(title: Config.retypePassTitle,
                              placeHolder: Config.retypePassPlaceholder,
                              text: $vm.retypePassword)
        }
    }
}

#Preview {
    ResendPasswordView(moveBackToLogin: .constant(true), userID: 0)
}
