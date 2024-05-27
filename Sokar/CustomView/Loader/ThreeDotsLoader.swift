//
//  ThreeDotsLoader.swift
//  Innate
//
//  Created by Taimoor Arif on 17/01/2024.
//

import SwiftUI

struct ThreeDotsLoader: View {
    var body: some View {
        HStack {
            DotView() // 1.
            DotView(delay: 0.2) // 2.
            DotView(delay: 0.4) // 3.
        }
    }
}

struct ThreeDotsLoader_Previews: PreviewProvider {
    static var previews: some View {
        ThreeDotsLoader()
    }
}

struct DotView: View {
    
    @State var delay: Double = 0
    @State var scale: CGFloat = 0.3
    
    var body: some View {
        
        Circle()
            .frame(width: 10, height: 10)
            .scaleEffect(scale)
            .animation(.easeIn(duration: 0.6).repeatForever().delay(delay), value: scale)
            .onAppear { // 1.
                withAnimation { // 2.
                    self.scale = 1 // 3.
                }
            }
    }
}

#Preview {
    ThreeDotsLoader()
}
