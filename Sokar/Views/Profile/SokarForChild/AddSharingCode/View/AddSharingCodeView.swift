//
//  AddSharingCodeView.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/04/2024.
//

import SwiftUI

struct AddSharingCodeView: View {
    
    private struct Config {
        
        static let screenTitle = "Add Sharing Code"
        
        static let topTitle = "Add Child Sharing Code"
        static let description = "PLease add sharing code that your child user have generated"
        
        static let note = "After adding sharing code then you can see the activity of your child user"
        
        static let buttonTitle = "Next"
    }
    
    @State private var openPopup = false
    
    @StateObject private var vm = AddSharingCodeVM()
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
            .sheet(isPresented: $openPopup, content: {
                
                AddSuccessfullyPopup(openPopup: $openPopup)
            })
    }
}

// MARK: LoadView
extension AddSharingCodeView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 30) {
            
            topTexts
            
            textfieldNote
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {
                self.openPopup.toggle()
            }
        }
        .topHorizontalPadding
    }
}

// MARK: Sub Views
extension AddSharingCodeView {
    
    @ViewBuilder
    var topTexts: some View {
        
        VStack {
            
            ScreenTitle(title: Config.screenTitle,
                        description: Config.description,
                        titleFont: .medium(size: 18))
        }
    }
    
    @ViewBuilder
    var textfieldNote: some View {
        
        VStack(spacing: 15) {
         
            CustomTextField(text: $vm.code,
                            title: "", placeholder: "Enter Code",
                            image: Image(""))
            
            NoteView(text: Config.note)
        }
    }
}

#Preview {
    AddSharingCodeView()
}
