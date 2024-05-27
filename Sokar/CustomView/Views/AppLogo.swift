//
//  AppLogo.swift
//  Koy
//
//  Created by Taimoor Arif on 01/09/2023.
//

import SwiftUI

struct AppLogo: View {
    
//    private var size: CGFloat = 62
//    private var fontSize: CGFloat = 35
    
//    init(size: CGFloat = 62, fontSize: CGFloat = 27) {
//        
//        self.size = size
//        self.fontSize = fontSize
//    }
    
    var body: some View {
        
        VStack {
            ImageName.appLogo
                .resizable()
                .scaledToFit()
                .frame(width: 62, height: 35)
            
            Text("SOKAR")
                .font(.medium(size: 23))
                .foregroundStyle(.accent)
        }
    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo()
    }
}
