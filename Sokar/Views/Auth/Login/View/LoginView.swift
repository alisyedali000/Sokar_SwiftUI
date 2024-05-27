//
//  LoginView.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    private struct Config {
        
        static let topTitle = "Login to your account"
        static let topDescription = "Add your account detail to get started to"
        
        static let emailTitle = "Email Address"
        static let emailPlaceholder = "Enter your email"
        
        static let passwordTitle = "Password"
        static let passwordPlaceholder = "Enter your password"
        
        static let forgotPassword = "Forget Password?"
        
        static let signupBtnTitle = "Sign in"
        
        static let notMember = "Not a member?"
        static let creatAccount = "Create an account"
    }
    
    @StateObject private var vm = LoginVM()
    
    @State private var moveToQuestionnaire = false
    
    var body: some View {
        
        loadView()
            .addBackground
            .navigationDestination(isPresented: $vm.moveToForgotPassword) {
                
                ForgetPasswordView(moveBackToLogin: $vm.moveToForgotPassword)
            }
            .navigationDestination(isPresented: $moveToQuestionnaire) {
                
                QuestionnaireView()
                    .hideNavigationBar
            }
    }
}

extension LoginView {
    
    func loadView() -> some View {
        
        ScrollView {
            
            VStack(spacing: 30) {
                
                AppLogo()
                
                ScreenTitle(title: Config.topTitle,
                            description: Config.topDescription, showAppName: true)
                
                textfields()
                
                DefaultButton(title: Config.signupBtnTitle) {
                    self.moveToQuestionnaire.toggle()
                }
                
                OrView()
                
                socialLogins
                
                notMember
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.never)
    }
}

extension LoginView {
    
    func textfields() -> some View {
        
        VStack(alignment: .trailing, spacing: 10) {
         
            CustomTextField(text: $vm.email,
                            title: Config.emailTitle,
                            placeholder: Config.emailPlaceholder,
                            image: Image(systemName: "envelope.fill"), keyboardType: .emailAddress)
            
            PasswordTextField(title: Config.passwordTitle,
                              placeHolder: Config.passwordPlaceholder,
                              text: $vm.password)
            
            Button {
                
                vm.moveToForgotPassword.toggle()
                
            } label: {
                
                Text(Config.forgotPassword)
                    .foregroundStyle(.accent)
                    .font(.regular(size: 12))
            }

        }
    }
    
    var socialLogins: some View {
        
        VStack {
            
            SignInButton(errorMessage: $vm.errorMessage,
                         showError: $vm.showError,
                         showLoader: $vm.showLoader,
                         vm: AppleSignInViewModel())
            
            SignInButton(errorMessage: $vm.errorMessage,
                         showError: $vm.showError,
                         showLoader: $vm.showLoader,
                         vm: GSignInViewModel())
        }
    }
    
    var notMember: some View {
        
        HStack {
            
            Text(Config.notMember)
                .foregroundStyle(.white)
            
            NavigationLink {
                
                SignUpView()
                    .hideNavigationBar
                
            } label: {
                Text(Config.creatAccount)
                    .foregroundStyle(.accent)
            }

        }
        .font(.regular(size: 12))
    }
}

#Preview {
    LoginView()
}
