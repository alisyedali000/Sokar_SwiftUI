//
//  PageThree.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 25/03/2024.
//

import SwiftUI

struct PageThree: View {
    
    @State private var slideAnimation: Bool = false
    
    @State private var bottomAnimation: Bool = false
    
    @Binding private var tab: Int
    
    init(tab: Binding<Int>) {
        
        self._tab = tab
    }
    
    var body: some View {
        
        loadView()
            .addBackground
            .onChange(of: tab) { _ , newValue in
                
                debugPrint("active tab \(newValue)")
                
                if newValue == 3 {
                    viewDidLoad()
                }
            }
//            .onAppear {
//                
//                debugPrint("active tab: \(tab)")
//                
//                if tab == 3 {
//                    
//                    viewDidLoad()
//                }
//            }
    }
}

extension PageThree {
 
    func loadView() -> some View {
        
        VStack {
            
            imagesView
            
            Spacer()
            
            SelectionIndicator(selectedIndex: 2)
                .padding(.vertical)
        }
    }
}

extension PageThree {
    
    var imagesView: some View {
        VStack {
            HStack {
                slidingImage(ImageName.pageThreeImgTwo, xOffset: -1)
                Spacer()
                slidingImage(ImageName.pageThreeImgOne, xOffset: 1)
            }
            Spacer()
            overlappingImages
            Spacer()
        }
    }
    
    var overlappingImages: some View {
        VStack(spacing: 0) {
            overlappingImage(ImageName.pageThreeImgFive, rotation: 5, xOffset: -1)
            overlappingImage(ImageName.pageThreeImgFour, rotation: -5, xOffset: 1)
            overlappingImage(ImageName.pageThreeImgThree, yOffset: 1)
                .padding(.top, -10)
        }
    }
    
    func slidingImage(_ imageName: Image, xOffset: CGFloat) -> some View {
        
        imageName
            .resizable()
            .scaledToFit()
            .swipeAnimation(startAnimation: slideAnimation, xOffset: xOffset)
    }
    
    func overlappingImage(_ imageName: Image, rotation: Double = 0, xOffset: CGFloat = 0, yOffset: CGFloat = 0) -> some View {
        imageName
            .resizable()
            .scaledToFit()
            .scaleEffect(0.9)
            .rotationEffect(.degrees(rotation))
            .swipeAnimation(startAnimation: bottomAnimation, xOffset: xOffset, yOffset: yOffset)
    }
}

extension PageThree {
    
    func viewDidLoad() {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
         
            debugPrint("pageThree")
            self.slideAnimation = false
            self.bottomAnimation = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.slideAnimation = true
            }
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            withAnimation(.easeOut(duration: 0.5)) {
                
                self.bottomAnimation = true
            }
        }
    }
}

#Preview {
    PageThree(tab: .constant(3))
}
