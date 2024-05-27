//
//  UserDetailView.swift
//  Sokar
//
//  Created by Taimoor Arif on 30/04/2024.
//

import SwiftUI
import Charts

struct UserDetailView: View {
    
    @StateObject private var vm = UserDetailVM()
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        
        loadView
            .addBackground
    }
}

// MARK: LoadView
extension UserDetailView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 30) {
         
            userDetails
            
            GlucoseView(glucoseData: vm.glucoseData)
            
            HeartRate(heartRate: vm.heartRate)
            
            Spacer(minLength: 0.1)
        }
        .topHorizontalPadding
    }
}

// MARK: Sub Views
extension UserDetailView {
    
    @ViewBuilder
    var userDetails: some View {
        
        VStack {
            
            user.image
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundStyle(.accent)
            
            Text(user.name)
                .foregroundStyle(.white)
                .font(.regular(size: 16))
            
            Text(user.email)
                .foregroundStyle(.white.opacity(0.5))
                .font(.light(size: 12))
        }
    }
}

#Preview {
    UserDetailView(user: userMock)
}
