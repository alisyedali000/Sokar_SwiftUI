//
//  KeyboardDoneButton.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    var addDoneButton: some View {
        modifier(DoneButton())
    }
}

struct DoneButton: ViewModifier {
       
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        UIApplication.shared.removeResponder()
                    }
                    .foregroundStyle(.blue)
                    .padding(.trailing, 20)
                }
            }
    }
}

extension UIApplication {
    
    func removeResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
