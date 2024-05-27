//
//  GSignInButton.swift
//  BattleRap
//
//  Created by Qazi Ammar Arshad on 07/03/2022.
//

import SwiftUI

struct SignInButton<T>: View where T: Authenticator {
    
    @Binding var errorMessage: String
    @Binding var showError: Bool
    @Binding var showLoader: Bool
    @ObservedObject var vm: T
    
    var body: some View {
        
        Button {
            
            vm.signIn()
            
        } label: {
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .frame(height: 54)
                
                HStack(spacing: 10) {
                    
                    let isAppleImage: Bool = vm.typeImage() == "apple" ? true : false
                    
                    isAppleImage ?
                    
                    AnyView(
                        Image(systemName: "apple.logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 22)
                            .foregroundStyle(.black)
                    ) :
                    
                    AnyView(
                        ImageName.google
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                    )
                    
                    Text(vm.typeName())
                        .foregroundColor(.black)
                        .font(.medium(size: 16))
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            errorMessage = vm.errorMessage
            showError = vm.showError
            showLoader = vm.showLoader
        }
    }
}

struct GSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        
        SignInButton(errorMessage: .constant("GSign In error"), showError: .constant(false), showLoader: .constant(false), vm: Mock())
    }
}

class Mock: Authenticator {
    
    var showLoader: Bool = false
    
    var errorMessage: String = ""
    
    var showError: Bool = true
    
    func typeName() -> String {
        "Login with Google"
    }
    
    func typeImage() -> String {
        "apple"
    }
    
    func signIn() {
        
    }
    
}
