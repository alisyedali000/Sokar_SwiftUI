//
//  GetImageModifier.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    func getPhoto(openConfirmationDialog: Binding<Bool>, completion: @escaping (UIImage, String) -> Void) -> some View {
        
        modifier(OpenImageConfirmationDialog(openConfirmationDialog: openConfirmationDialog, completion: completion))
    }
}

struct OpenImageConfirmationDialog : ViewModifier {
    
    @State private var sourceType : UIImagePickerController.SourceType = .camera
    @State private var openPhotos = false
    
    @Binding private var openConfirmationDialog: Bool
    private var completion: (UIImage, String) -> Void
    
    init(openConfirmationDialog: Binding<Bool>, completion: @escaping (UIImage, String) -> Void) {
        
        self._openConfirmationDialog = openConfirmationDialog
        self.completion = completion
    }
    
    func body(content: Content) -> some View {
        
        content
            .confirmationDialog("Choose an option", isPresented: $openConfirmationDialog) {
                
                Button("Camera") {
                    self.sourceType = .camera
                    self.openPhotos.toggle()
                }

                Button("Gallery") {
                    self.sourceType = .photoLibrary
                    self.openPhotos.toggle()
                }
            }
            .sheet(isPresented: $openPhotos, content: {
                
                ImagePickerView(allowsEditing: true, sourceType: sourceType) { image, imageName in
                    
                    completion(image, imageName ?? "Image")
                }
            })
    }
}
