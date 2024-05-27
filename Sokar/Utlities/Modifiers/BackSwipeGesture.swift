//
//  BackSwipeGesture.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

extension View {
    func onBackSwipe(perform action: @escaping () -> Void) -> some View {
        gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80 {
                        action()
                    }
                })
        )
    }
}
