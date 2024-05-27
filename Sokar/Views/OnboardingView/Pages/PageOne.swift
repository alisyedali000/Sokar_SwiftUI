//
//  PageOne.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 24/03/2024.
//

import SwiftUI

struct PageOne: View {
    
    @State private var imageAnimation: Bool = false
    @State private var textAnimation: Bool = false
    
    var body: some View {
        
        loadView
            .addBackground
            .onAppear {
                viewDidLoad()
            }
    }
}

// MARK: UIView Ex
extension PageOne {
    
    var loadView: some View {
        
        VStack {
            
            imagesView
            
            SelectionIndicator(selectedIndex: 0)
                .padding(.vertical)
            
            bottomText
        }
    }
    
    var imagesView: some View {
        VStack {
            
            ImageName.pageOneImageOne
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 124)
                .scaleEffect(imageAnimation ? 1 : 0.5)
            
            
            HStack {
                
                ImageName.pageOneImageThree
                    .resizable()
                    .scaledToFit()
                    .offset(y: 20)
                    .scaleEffect(imageAnimation ? 1 : 1.4)
                
                Spacer()
                
                ImageName.pageOneImageTwo
                    .resizable()
                    .scaledToFit()
                    .offset(y: -20)
                    .scaleEffect(imageAnimation ? 1 : 0.5)
                
            }
            
            ImageName.pageOneImageFour
                .resizable()
                .scaledToFit()
                .frame(width: 260)
                .scaleEffect(imageAnimation ? 1 : 1.4)
            
        }
    }
    
    var bottomText: some View {
        VStack {
            HStack {
                Text("Community")
                    .foregroundStyle(.accent)
                Text("of")
            }
            Text("peers for support")
        }
        .foregroundStyle(.white)
        .font(SokarFont.medium.getFont(size: .h5))
        .swipeAnimation(startAnimation: textAnimation, xOffset: -1)     
    }
}

// MARK: CustomFunction Ex
extension PageOne {
    func viewDidLoad() {
        debugPrint("pageOne")
        self.imageAnimation = false
        self.textAnimation = false
        withAnimation(.easeOut(duration: 0.7)) {
            self.imageAnimation = true
            self.textAnimation = true
        }
    }
}

#Preview {
    PageOne()
}
