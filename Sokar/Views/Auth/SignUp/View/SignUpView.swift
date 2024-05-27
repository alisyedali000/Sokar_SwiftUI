//
//  SignUpView.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct SignUpView: View {
    
    private struct Config {
        
        static let topTitle = "Create an account"
        static let topDescription = "Get started by adding your details"
        
        static let nameTitle = "Name"
        static let namePlaceholder = "Enter your name"
        
        static let emailTitle = "Email Address"
        static let emailPlaceholder = "Enter your email"
        
        static let passwordTitle = "Password"
        static let passwordPlaceholder = "Enter your password"
        
        static let signinBtnTitle = "Sign Up"
        
        static let alreadyMember = "Already a member?"
        static let signup = "Sign Up"
    }
    
    @StateObject private var vm = SignUpVM()
    @Environment(\.dismiss) var dismiss
    
    @State private var moveToQuestionnaire = false
    
    var body: some View {
        
        loadView()
            .addBackground
            .onBackSwipe {
                self.dismiss()
            }
            .navigationDestination(isPresented: $moveToQuestionnaire) {
                
                QuestionnaireView()
                    .hideNavigationBar
            }
    }
}

extension SignUpView {
    
    func loadView() -> some View {
        
        ScrollView {
            
            VStack(spacing: 30) {
                
                AppLogo()
                
                ScreenTitle(title: Config.topTitle,
                            description: Config.topDescription)
                
                textfields()
                
                DefaultButton(title: Config.signinBtnTitle) {
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

extension SignUpView {
    
    func textfields() -> some View {
        
        VStack(spacing: 10) {
         
            CustomTextField(text: $vm.name,
                            title: Config.nameTitle,
                            placeholder: Config.namePlaceholder,
                            image: Image(systemName: "person.fill"))
            
            CustomTextField(text: $vm.email,
                            title: Config.emailTitle,
                            placeholder: Config.emailPlaceholder,
                            image: Image(systemName: "envelope.fill"), keyboardType: .emailAddress)
            
            PasswordTextField(title: Config.passwordTitle,
                              placeHolder: Config.passwordPlaceholder,
                              text: $vm.password)
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
            
            Text(Config.alreadyMember)
                .foregroundStyle(.white)
            
            Button {
                self.dismiss()
            } label: {
                Text(Config.signup)
                    .foregroundStyle(.accent)
            }

        }
        .font(.regular(size: 12))
    }
}

#Preview {
    SignUpView()
}
