//
//  AppleSignInViewModel.swift
//  Unified
//
//  Created by Qazi Ammar Arshad on 25/07/2022.
//

import Foundation
import SwiftUI
import AuthenticationServices

@MainActor final class AppleSignInViewModel: NSObject, Authenticator {
    
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    @Published var showLoader: Bool = false
    var token = ""
    
    private let appleSign = AppleSignIn()
    
    func showError(message: String) {
        
        DispatchQueue.main.async {
            self.errorMessage = message
            self.showError = true
        }
    }
    
    func signIn() {

        appleSign.handleAppleIdRequest { appleCredentials in
            
            Task {
                
//                await self.callAPI(user: appleCredentials)
            }
        }
    }
    
    func showErr(message: String) {
        showError = true
        errorMessage = message
    }
    
    func typeName() -> String {
        "Sign in with Apple"
    }
    
    func typeImage() -> String {
        "apple"
    }
    
}

// Apple SignUp Extension

//extension AppleSignInViewModel: NetworkManagerService {
//    
//    @MainActor func callAPI(user: ASAuthorizationAppleIDCredential) async {
//        
//        self.showLoader = true
//        
//        let token = user.user
//        
//        let name = user.fullName?.givenName ?? ""
//        let email = user.email ?? ""
//        
//        let endPoint : AuthEndPoints = .socialSignUp(email: email, name: name, token: token, key: "apple")
//        let request = await sendRequest(endpoint: endPoint, responseModel: UserModel.self)
//        
//        self.showLoader = false
//        
//        switch request {
//            
//        case .success(let data):
//            
//            debugPrint(data.message ?? "")
//            UserDefaultManager.shared.set(user: data.data ?? User())
//            UserDefaultManager.shared.saveAuthenticationToken(from: data.user_token ?? "")
//            
//            UserDefaultManager.Authenticated.send(true)
//            
//        case .failure(let error):
//            
//            debugPrint(error)
//            self.showError(message: error.customMessage)
//        }
//    }
//}
