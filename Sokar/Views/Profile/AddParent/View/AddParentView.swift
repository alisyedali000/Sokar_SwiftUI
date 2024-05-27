//
//  AddPArentView.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct AddParentView: View {
    
    private struct Config {
        
        static let screenTitle = "Add Parent/User/Doctor"
        
        static let alreadyAddedTitle = "Already Added Parents"
        
        static let buttonTitle = "Add More"
    }
    
    @StateObject private var vm = AddParentVM()
    
    @State private var moveToAddParent = false
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
            .navigationDestination(isPresented: $moveToAddParent) {
                
                SokarForParentsView()
            }
    }
}

// MARK: Load view
extension AddParentView {
    
    var loadView: some View {
        
        VStack {
            
            allUsers
            
            StrokeButton(title: Config.buttonTitle) {
                self.moveToAddParent.toggle()
            }
            
            Spacer()
        }
        .topHorizontalPadding
    }
}

extension AddParentView {
    
    var allUsers: some View {
        
        VStack(alignment: .leading) {
            
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

#Preview {
    AddParentView()
}
