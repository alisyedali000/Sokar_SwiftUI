//
//  AppBGView.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 24/03/2024.
//

import SwiftUI

struct AppBG: View {
    
    var body: some View {
        ZStack{
            Color.black
            VStack {
                HStack{
                    Circle()
                        .frame(width: 250)
                        .foregroundStyle(.accent)
                        .blur(radius: 180, opaque: false)
                        .position(x: -70)
                }
                Spacer()
                
                HStack{
                    Spacer()
                    
                    Circle()
                        .frame(width: 250)
                        .foregroundStyle(.accent)
                        .blur(radius: 200, opaque: false)
                }
            }
            
            
            
        }.ignoresSafeArea()
    }
    
}

#Preview {
    AppBG()
}
