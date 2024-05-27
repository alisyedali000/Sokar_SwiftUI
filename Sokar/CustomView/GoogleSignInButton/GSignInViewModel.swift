//
//  GsignInViewModel.swift
//  Innate
//
//  Created by Taimoor Arif on 13/12/2023.
//

import Foundation
import UIKit
//import GoogleSignIn
import SwiftUI
//import FirebaseCore

@MainActor final class GSignInViewModel: Authenticator {
    
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    @Published var showLoader: Bool = false
    
    func showError(message: String) {
        
        DispatchQueue.main.async {
            self.errorMessage = message
            self.showError = true
        }
    }
    
    func signIn() {
//        
//        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
//        
//        guard let clientID = FirebaseApp.app()?.options.clientID else {
//            debugPrint("client id is empty")
//            return
//        }
//
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration(clientID: clientID)
//
//        GIDSignIn.sharedInstance.configuration = config
//        
//        // Start the sign in flow!
//        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
//            
//            if let error = error {
//                debugPrint(error)
//                return
//            }
//            
//            guard let user = result?.user else { return }
//            
//            Task {
//                
//                await self.callAPI(user: user)
//            }
//        }
    }
    
    func signOut(){
//        GIDSignIn.sharedInstance.signOut()
//        self.checkStatus()
    }
    
    func typeName() -> String {
        "Sign in with Google"
    }
    
    func typeImage() -> String {
        "google"
    }
}

//extension GSignInViewModel: NetworkManagerService {
//    
//    @MainActor func callAPI(user: GIDGoogleUser) async {
//        
//        self.showLoader = true
//        
//        let name = user.profile?.name ?? ""
//        let email = user.profile?.email ?? ""
//        let token = user.userID ?? ""
//        
//        let endPoint : AuthEndPoints = .socialSignUp(email: email, name: name, token: token, key: "google")
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
