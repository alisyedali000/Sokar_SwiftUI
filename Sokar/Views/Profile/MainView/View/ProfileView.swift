//
//  ProfileView.swift
//  Sokar
//
//  Created by Taimoor Arif on 05/04/2024.
//

import SwiftUI

struct ProfileView: View {
    
    private struct Config {
        
        static let screenTitle = "Profile"
        
        static let diabetes = "Diabetes"
        static let gender = "Gender"
        
        static let personal = "Personal"
        
        static let age = "Age"
        static let weight = "Weight"
        static let height = "Height"
        static let preferences = "Preferences"
        
        static let connectedDevices = "My Connected Devices"
        
        static let backgroundColor = Color.white.opacity(0.1)
    }
    
    @StateObject private var vm = ProfileVM()
    
    @State private var user = userMock
    
    var body: some View {
        
        loadView
            .addBackground
    }
}

// MARK: Load View
extension ProfileView {
    
    var loadView: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            topNavigation
            
            topInfo
            
            personalView
            
            connectedDevices
            
            Spacer(minLength: 0.01)
        }
        .padding(.horizontal)
    }
}

// MARK: Sub Views
extension ProfileView {
    
    @ViewBuilder
    var topNavigation: some View {
        
        ZStack {
            
            Text(Config.screenTitle)
                .foregroundStyle(.white)
                .font(.medium(size: 18))
            
            HStack {
                
                Spacer()
                
                NavigationLink {
                    SettingsView()
                } label: {
                    
                    toolbarButton
                }
            }
        }
    }
    
    var topInfo: some View {
        
        VStack(spacing: 15) {
            
            ZStack {
                
                backgroundView(height: 79)
                
                nameImage
            }
            
            diabetesGender
        }
    }
    
    var nameImage: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                // name
                Text(user.name)
                    .foregroundStyle(.white)
                    .font(.medium(size: 18))
                
                // email
                Text(user.email)
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.light(size: 14))
            }
            
            Spacer()
            
            user.image
                .resizable()
                .scaledToFill()
                .frame(width: 53, height: 53)
                .foregroundStyle(.accent)
                .contentShape(Circle())
                
        }
        .padding()
    }
    
    var diabetesGender: some View {
        
        HStack(spacing: 13) {
            
            singleView(title: Config.diabetes,
                       value: user.diabetesType,
                       image: ImageName.diabetic)
            
            singleView(title: Config.gender,
                       value: user.gender,
                       image: ImageName.profileGender)
        }
    }
    
    func singleView(title: String, value: String, image: Image) -> some View {
        
        ZStack {
            
            backgroundView(height: 79)
            
            VStack(alignment: .leading) {
                
                titleCustomView(title: title, image: image)
                
                Text(value)
                    .foregroundStyle(.white)
                    .font(.medium(size: 19))
            }
            .padding()
        }
    }
    
    func titleCustomView(title: String, image: Image) -> some View {
        
        HStack {
            
            Text(title)
                .foregroundStyle(.white.opacity(0.7))
                .font(.light(size: 13))
            
            Spacer()
            
            image
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
    }
}

// MARK: Personal View
extension ProfileView {
    
    var personalView: some View {
        
        VStack(alignment: .leading, spacing: 15) {
           
            Text(Config.personal)
                .foregroundStyle(.white.opacity(0.6))
                .font(.regular(size: 14))
            
            ageWeight
            
            height
        }
    }
    
    var ageWeight: some View {
        
        HStack(spacing: 13) {
            
            singleAgeView(title: Config.age,
                          value: user.age)
            
            singleAgeView(title: Config.weight,
                          value: "\(user.weight)kg")
        }
    }
    
    func singleAgeView(title: String, value: String) -> some View {
        
        ZStack {
            
            backgroundView(height: 54)
            
            HStack {
                
                Text(title)
                    .font(.light(size: 13))
                    .foregroundStyle(.white.opacity(0.7))
                
                Spacer()
                
                Text(value)
                    .font(.regular(size: 16))
                    .foregroundStyle(.white)
            }
            .padding()
        }
    }
    
    var height: some View {
        
        singleAgeView(title: Config.height, value: "\(user.height)cm")
    }
    
    var preferences: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 5) {
             
                Text(Config.preferences)
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.light(size: 13))
                
                Text(user.foodPreference.joined(separator: "  |  "))
                    .foregroundStyle(.white)
                    .font(.regular(size: 13))
            }
            .showFullText
            
            Spacer(minLength: 0.01)
        }
        .padding()
        .background {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(Config.backgroundColor)
        }
    }
}

// MARK: Connected Devices
extension ProfileView {
    
    var connectedDevices: some View {
        
        VStack {
            
            bottomHeader
            
            allDevices
        }
    }
    
    var bottomHeader: some View {
        
        HStack {
            
            Text(Config.connectedDevices)
                .foregroundStyle(.white.opacity(0.6))
                .font(.regular(size: 14))
            
            Spacer()
        }
    }
    
    var allDevices: some View {
        
        VStack {
            
            ConnectedDeviceCell(device: vm.connectedDevice)
        }
    }
}

extension ProfileView {
    
    var toolbarButton: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 11)
                .foregroundColor(Config.backgroundColor)
                .frame(width: 35, height: 35)
            
            Image(systemName: "gearshape.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.accent)
        }
    }
    
    func backgroundView(height: CGFloat) -> some View {
        
        RoundedRectangle(cornerRadius: 14)
            .foregroundStyle(Config.backgroundColor)
            .frame(height: height)
    }
}

#Preview {
    ProfileView()
}
