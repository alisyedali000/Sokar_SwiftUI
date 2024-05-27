//
//  PageTwo.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 25/03/2024.
//

import SwiftUI

struct PageTwo: View {
    
    @State private var topdownAnimation: Bool = false
    @State private var scaleAnimation: Bool = false
    
    @Binding private var tab: Int
    
    init(tab: Binding<Int>) {
        
        self._tab = tab
    }
    
    var body: some View {
        loadView
            .addBackground
            .onChange(of: tab) { _ , newValue in
                
                debugPrint("active tab \(newValue)")
                
                if newValue == 2 {
                    viewDidLoad()
                }
            }
//            .onAppear {
//                
//                debugPrint("active tab: \(tab)")
//                
//                if tab == 2 {
//                    
//                    viewDidLoad()
//                }
//            }
    }
}

// MARK: UIView Ex
extension PageTwo {
    
    var loadView: some View {
        
        VStack {
            
            imagesView
            
            Spacer()
            
            SelectionIndicator(selectedIndex: 1)
                .padding(.vertical)
            
        }
    }
    
    var imagesView: some View {
        VStack {
            ImageName.pageTwoImageOne
                .resizable()
                .scaledToFit()
                .swipeAnimation(startAnimation: topdownAnimation, xOffset: -1)
            
            VStack {
                ImageName.pageTwoImageTwo
                    .resizable()
                    .scaledToFit()
                    .offset(y: 10)
                    .frame(maxHeight: 130)
                    .scaleEffect(scaleAnimation ? 1 : 1.1)
                    .rotationEffect(.degrees(-15.0))
                
                ImageName.pageTwoImageThree
                    .resizable()
                    .scaledToFit()
                
                    .frame(maxHeight: 100)
                    .scaleEffect(scaleAnimation ? 1 : 0.9)
                    .rotationEffect(.degrees(15.0))
                
            }
            .swipeAnimation(startAnimation: topdownAnimation, xOffset: 1)
        }
    }
}

// MARK: CustomFunction Ex
extension PageTwo {
    func viewDidLoad() {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
         
            debugPrint("pageTwo")
            self.topdownAnimation = false
            self.scaleAnimation = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.topdownAnimation = true
                self.scaleAnimation = true
            }
//        }
    }
}

#Preview {
    PageTwo(tab: .constant(2))
}
