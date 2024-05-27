//
//  PageFour.swift
//  Sokar
//
//  Created by Qazi Ammar Arshad on 25/03/2024.
//

import SwiftUI

struct PageFour: View {
    
    @State private var slideAnimation: Bool = false
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
                
                if newValue == 4 {
                    viewDidLoad()
                }
            }
    }
}

// MARK: UIView Ex
extension PageFour {
    var loadView: some View {
        
        VStack {
            imagesView
            Spacer()
            SelectionIndicator(selectedIndex: 3)
                .padding(.vertical)
            bottomText
            
            NavigationDefaultButton(title: "Get Started", showImage: true) {
                
                LoginView()
                    .hideNavigationBar
            }
            .swipeAnimation(startAnimation: slideAnimation, yOffset: 1)
            .padding([.horizontal, .bottom] )
            
        }
    }
    
    var imagesView: some View {
        VStack {
            ImageName.pageFourImageOne
                .resizable()
                .scaledToFit()
                .scaleEffect(scaleAnimation ? 1 : 0.6)
            
        }
    }
    
    var bottomText: some View {
        VStack {
            HStack {
                Text("Complete ")
                    .foregroundStyle(.accent)
                Text("set up")
            }
            Text("and start tracking")
        }
        .foregroundStyle(.white)
        .font(SokarFont.medium.getFont(size: .h5))
        .swipeAnimation(startAnimation: slideAnimation, xOffset: -1)
    }
}

// MARK: CustomFunction Ex
extension PageFour {
    
    func viewDidLoad() {
        
        debugPrint("pageFour")
        self.slideAnimation = false
        self.scaleAnimation = false
        withAnimation(.easeOut(duration: 0.5)) {
            self.slideAnimation = true
            self.scaleAnimation = true
        }
    }
}
#Preview {
    PageFour(tab: .constant(4))
}
