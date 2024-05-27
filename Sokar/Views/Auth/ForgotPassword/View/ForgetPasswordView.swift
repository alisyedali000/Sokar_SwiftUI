//
//  ForgetPasswordView.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    private struct Config {
        
        static let topTitle = "Forget Password"
        static let topDescription = "Enter your old email address so that we can send you an OTP to reset your Password"
        
        static let emailTitle = "Email Address"
        static let emailPlaceholder = "Enter your email"
        
        static let sendOtp = "Send OTP"
        
        static let bottomBtnTitle = "Verify"
    }
    
    @StateObject private var vm = ForgetPasswordVM()
    
    @FocusState var isKeyboardShowing: Bool
    
    @Binding private var moveBackToLogin: Bool
    
    init(moveBackToLogin: Binding<Bool>) {
        
        self._moveBackToLogin = moveBackToLogin
    }
    
    var body: some View {
        
        ZStack {
            
            loadView()
            
            LoaderView(showLoader: $vm.showLoader)
        }
        .addBackground
        .navigationTitle("")
        .alert(vm.errorMessage, isPresented: $vm.showError, actions: {})
        .navigationDestination(isPresented: $vm.moveToChangePassword) {
            
            ResendPasswordView(moveBackToLogin: $moveBackToLogin, userID: vm.userID)
        }
    }
}

extension ForgetPasswordView {
    
    func loadView() -> some View {
    
        VStack(spacing: 40) {
            
            ScreenTitle(title: Config.topTitle,
                        description: Config.topDescription)
            
            textfields()
            
            Spacer()
            
            DefaultButton(title: Config.bottomBtnTitle) {
                
                vm.moveToChangePassword.toggle()
            }
//            .disableWithOpacity(vm.otp.count < 4 || !(vm.isCodeSent))
        }
        .padding(.horizontal)
        .padding(.top, 50)
    }
}

extension ForgetPasswordView {
    
    func textfields() -> some View {
        
        VStack(spacing: 15) {
            
            CustomTextField(text: $vm.email,
                            title: Config.emailTitle,
                            placeholder: Config.emailPlaceholder,
                            image: Image(systemName: "envelope.fill"),
                            keyboardType: .emailAddress)
            .onChange(of: vm.email) {
                
//                withAnimation {
//                    vm.otp = ""
//                    vm.isCodeSent = false
//                }
            }
            
            HStack {
                Spacer()
                
                Button(action: {
//                    vm.callSendOTPApi()
                }, label: {
                    Text(Config.sendOtp)
                        .foregroundStyle(.accent)
                        .font(.light(size: 14))
                })
            }
            .onChange(of: vm.isCodeSent) {
                
//                if vm.isCodeSent == true {
//                    self.isKeyboardShowing = true
//                }
            }
            
//            if vm.isCodeSent {
                OTPTextfield(otpText: $vm.otp.max(4),
                             isKeyboardShowing: _isKeyboardShowing)
//            }
        }
        .addDoneButton
    }
}

#Preview {
    ForgetPasswordView(moveBackToLogin: .constant(true))
}
