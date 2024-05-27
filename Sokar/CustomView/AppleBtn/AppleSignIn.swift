//
//  AppleSignIn.swift
//  Innate
//
//  Created by Taimoor Arif on 12/12/2023.
//


import UIKit
import AuthenticationServices

class AppleSignIn: NSObject {
    var completionHandler: (_ appleCredentials: ASAuthorizationAppleIDCredential) -> Void = { _ in }

    @objc func handleAppleIdRequest(block: @escaping (_ appleCredentials: ASAuthorizationAppleIDCredential) -> Void) {
        completionHandler = block
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }

    func getCredentialState(userID: String) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userID) { credentialState, _ in
            switch credentialState {
            case .authorized:
                // The Apple ID credential is valid.
                break
            case .revoked:
                // The Apple ID credential is revoked.
                break
            case .notFound:
                // No credential was found, so show the sign-in UI.
                break
            default:
                break
            }
        }
    }
}

extension AppleSignIn: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            getting user details
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let token = userIdentifier
            debugPrint("User id is \(token) \n Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))")

            completionHandler(appleIDCredential)

            getCredentialState(userID: userIdentifier)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        debugPrint("error in sign in with apple: \(error.localizedDescription)")
    }
}
