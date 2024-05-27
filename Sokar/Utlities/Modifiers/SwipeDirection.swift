//
//  SwipeDirection.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

func detectDirection(value: DragGesture.Value) -> SwipeDirection {
    
    if value.startLocation.x < value.location.x - 24 {
        return .left
    }
    if value.startLocation.x > value.location.x + 24 {
        return .right
    }
    if value.startLocation.y < value.location.y - 24 {
        return .down
    }
    if value.startLocation.y > value.location.y + 24 {
        return .upward
    }
    return .none
}

enum SwipeDirection: String {
    case left
    case right
    case upward
    case down
    case none
}
