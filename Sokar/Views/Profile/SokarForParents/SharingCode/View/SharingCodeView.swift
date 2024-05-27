//
//  SharingCodeView.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/04/2024.
//

import SwiftUI

struct SharingCodeView: View {
    
    private struct Config {
        
        static let screenTitle = "Sharing Code"
        
        static let descriptionTitle = "Sharing your pairing code"
        static let description = "Your parent will receive a link to download the SOKAR app. He will then use the code"
        
        static let note = "your personal data is important, share it with a trusted, responsible partner"
    }
    
    @StateObject private var vm = SharingCodeVM()
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
            .toolbar(content: {
                
            })
    }
}

// MARK: LoadView
extension SharingCodeView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            topTexts
            
            codeView
            
            NoteView(text: Config.note)
            
            Spacer()
        }
        .topHorizontalPadding
    }
}

// MARK: Sub Views
extension SharingCodeView {
    
    @ViewBuilder
    var topTexts: some View {
        
        VStack(spacing: 20) {
            
            Group {
                
                Text("Sokar ")
                    .foregroundStyle(.accent)
                +
                Text("For Parents")
                    .foregroundStyle(.white)
            }
            .font(.medium(size: 24))
            
            VStack(spacing: 5) {
                
                Text(Config.descriptionTitle)
                    .foregroundStyle(.white)
                    .font(.medium(size: 18))
                    
                Text(Config.description)
                        .font(.light(size: 14))
                        .foregroundStyle(.white.opacity(0.7))
            }
            .multilineTextAlignment(.center)
        }
    }
    
    @ViewBuilder
    var codeView: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 48)
            
            Text(vm.pairingCode)
                .foregroundStyle(.white)
                .font(.light(size: 20))
        }
    }
}

// MARK: Toolbar button
extension SharingCodeView {
    
    @ViewBuilder
    var toolBarButton: some View {
        
        Button {
            
        } label: {
            
            ImageName.share
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
        }
    }
}

#Preview {
    SharingCodeView()
}
