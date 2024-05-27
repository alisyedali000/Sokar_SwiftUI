//
//  AddChildView.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/04/2024.
//

import SwiftUI

struct AddChildView: View {
    
    private struct Config {
        
        static let screenTitle = "Add Child"
        
        static let alreadyAddedTitle = "Already Added Child"
        
        static let buttonTitle = "Add More"
    }
    
    @StateObject private var vm = AddChildVM()
    
    @State private var moveToAddChild = false
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
            .navigationDestination(isPresented: $moveToAddChild) {
                
                SokarForChildView()
            }
    }
}

// MARK: Load view
extension AddChildView {
    
    var loadView: some View {
        
        VStack {
            
            allUsers
            
            StrokeButton(title: Config.buttonTitle) {
                self.moveToAddChild.toggle()
            }
            
            Spacer()
        }
        .topHorizontalPadding
    }
}

extension AddChildView {
    
    var allUsers: some View {
        
        VStack(alignment: .leading) {
            
            if vm.allUsers.count > 0 {
                
                Text(Config.alreadyAddedTitle)
                    .font(.regular(size: 14))
                    .foregroundStyle(.white.opacity(0.6))
                
                VStack {
                    
                    ForEach(vm.allUsers) { user in
                        
                        NavigationLink {
                         
                            UserDetailView(user: user)
                            
                        } label: {
                            
                            UserCell(user: user) {
                                
                                withAnimation(.smooth(duration: 0.5)) {
                                    
                                    if let index = vm.allUsers.firstIndex(where: { $0.id == user.id }) {
                                        
                                        vm.allUsers.remove(at: index)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddChildView()
}
