//
//  SettingsView.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import SwiftUI

struct SettingsView: View {
    
    private struct Config {
        
        static let screenTitle = "Settings"
        
        static let general = "General"
        static let additional = "Additional"
        static let support = "Support"
        
        static let buttonTitle = "LogOut"
    }
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
    }
}

// MARK: Load View
extension SettingsView {
    
    var loadView: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                generalView
                
                additionalView
                
                supportView
                
                DefaultButton(title: Config.buttonTitle) {
                    
                }
            }
            .topHorizontalPadding
        }
        .scrollIndicators(.hidden)
    }
}

extension SettingsView {
    
    var generalView: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text(Config.general)
                .foregroundStyle(.white.opacity(0.6))
                .font(.regular(size: 14))
            
            NavigationLink {
                EditProfileView()
            } label: {
                
                SettingsCell(type: .editProfile)
            }

            
            NavigationLink {
                ChangePasswordView()
            } label: {
            
                SettingsCell(type: .changePassword)
            }
            
            NavigationLink {
                ChangeDiabeticTypeView()
            } label: {
                SettingsCell(type: .diabeticType)
            }

            
            SettingsCell(type: .subscription)
        }
    }
    
    var additionalView: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text(Config.additional)
                .foregroundStyle(.white.opacity(0.6))
                .font(.regular(size: 14))
            
            NavigationLink {
                AddParentView()
            } label: {
                
                SettingsCell(type: .addParent)
            }

            NavigationLink {
                AddChildView()
            } label: {
                
                SettingsCell(type: .addChild)
            }
        }
    }
    
    var supportView: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text(Config.support)
                .foregroundStyle(.white.opacity(0.6))
                .font(.regular(size: 14))
            
            SettingsCell(type: .privacyPolicy)
            
            SettingsCell(type: .termsConditions)
            
            SettingsCell(type: .deleteAccount)
        }
    }
}

#Preview {
    SettingsView()
}
