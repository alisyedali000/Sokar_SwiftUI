//
//  AddSuccessfullyPopup.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct AddSuccessfullyPopup: View {
    
    private struct Config {
        
        static let title = "Added Successfully"
        
        static let description = "Congratulations, You have added a new child user successfully"
        
        static let buttonTitle = "Done"
    }
    
    @Binding private var openPopup: Bool
    
    init(openPopup: Binding<Bool>) {
        self._openPopup = openPopup
    }
    
    var body: some View {
        
        loadView
            .addBackgroundColor(color: Color(hex: "#081314"))
            .addSheetHeight(detents: [.fraction(0.4)])
    }
}

// MARK: Load View
extension AddSuccessfullyPopup {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            AnimatedImage(name: "Success.gif")
                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
            //                .customLoopCount(2) // Custom loop count
                .playbackRate(2.0) // Playback speed rate
                .indicator(.activity) // Activity Indicator
                .transition(.fade) // Fade Transition
                .scaledToFill()
                .frame(width: 172, height: 155)
            
            ScreenTitle(title: Config.title,
                        description: Config.description,
                        titleFont: .medium(size: 18),
                        descriptionFont: .light(size: 12))
            
            DefaultButton(title: Config.buttonTitle) {
                self.openPopup.toggle()
            }
        }
        .padding()
    }
}

#Preview {
//    AddSuccessfullyPopup(openPopup: .constant(false))
    AddSharingCodeView()
}
