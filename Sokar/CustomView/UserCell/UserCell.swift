//
//  UserCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct UserCell: View {
    
    private var user: User
    private var deleteAction: () -> Void
    
    init(user: User, deleteAction: @escaping () -> Void) {
        self.user = user
        self.deleteAction = deleteAction
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load view
extension UserCell {
    
    var loadView: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 70)
            
            userDetails
        }
    }
    
    var userDetails: some View {
        
        HStack {
            
            image
            
            nameEmail
            
            Spacer(minLength: 0.01)
            
            deleteBtn
        }
        .padding(.horizontal)
    }
}

// MARK: Sub views
extension UserCell {
    
    var image: some View {
        
        user.image
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .foregroundStyle(.accent)
    }
    
    var nameEmail: some View {
        
        VStack(alignment: .leading) {
            
            Text(user.name)
                .foregroundStyle(.white)
                .font(.regular(size: 16))
            
            Text(user.email)
                .foregroundStyle(.white)
                .font(.light(size: 12))
        }
    }
    
    var deleteBtn: some View {
        
        Button {
            self.deleteAction()
        } label: {
            
            Image(systemName: "trash.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    UserCell(user: userMock, deleteAction: {})
}
