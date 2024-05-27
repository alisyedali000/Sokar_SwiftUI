//
//  CustomConfirmationDialog.swift
//  Unified
//
//  Created by Taimoor Arif on 08/06/2023.
//

import SwiftUI

// *** Custom ConfirmDialog Modifier and View extension

extension View {
    func customConfirmDialog<A: View>(isPresented: Binding<Bool>, @ViewBuilder actions: @escaping () -> A) -> some View {
        return self.modifier(MyCustomModifier(isPresented: isPresented, actions: actions))
    }
}

struct MyCustomModifier<A>: ViewModifier where A: View {
    
    @Binding var isPresented: Bool
    @ViewBuilder let actions: () -> A
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ZStack(alignment: .bottom) {
                if isPresented {
                    Color.primary.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isPresented = false
                        }
                        .transition(.opacity)
                }
                
                if isPresented {
                    VStack {
                        GroupBox {
                            actions()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        GroupBox {
                            
                            Button(role: .cancel) {
                                isPresented = false
                            } label: {
                                Text("Cancel")
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                        }
                    }
                    .font(.title3)
                    .padding(8)
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}
