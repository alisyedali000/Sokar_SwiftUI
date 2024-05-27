//
//  PairTransmitterView.swift
//  Sokar
//
//  Created by Taimoor Arif on 09/05/2024.
//

import SwiftUI

struct PairTransmitterView: View {
    
    private struct Config {
        
        static let screenTitle = "Pair Transmitter"
        
        static let enterSerialNo = "Enter Transmitter Serial Number"
        
        static let noteTitle = "Note:"
        static let noteDescription = "If your glucose alerts and sensor glucose readings do not match your symptoms or expectation measure your fingure stick glucose with a blood glucose meter"
        
        static let buttonTitle = "Continue"
    }
    
    @StateObject private var vm = PairTransmitterVM()
    @Environment (\.dismiss) var dismiss
    
    private var continueTapped: () -> Void
    
    init(continueTapped: @escaping () -> Void) {
        
        self.continueTapped = continueTapped
    }
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
    }
}

// MARK: Load View
extension PairTransmitterView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 40) {
            
            topImage
            
            serialNumber
            
            Spacer(minLength: 0.1)
            
            note
            
            DefaultButton(title: Config.buttonTitle) {
                continueTapped()
                self.dismiss()
            }
        }
        .topHorizontalPadding
    }
}

// MARK: Sub Views
extension PairTransmitterView {
    
    @ViewBuilder
    var topImage: some View {
        
        Group {
            
            let screenSize = UIScreen.main.bounds
            
            ImageName.pairTransmitter
                .resizable()
                .scaledToFill()
                .frame(width: screenSize.width * 0.7,
                       height: screenSize.height * 0.37)
                .clipped()
        }
        .padding(.top)
    }
    
    @ViewBuilder
    var serialNumber: some View {
        
        VStack(spacing: 0) {
            
            Text(Config.enterSerialNo)
                .foregroundStyle(.white)
                .font(.regular(size: 18))
            
            OTPTextfield(otpText: $vm.serialNumber, maxBoxes: 6)
        }
    }
    
    @ViewBuilder
    var note: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(Config.noteTitle)
                    .foregroundStyle(.white)
                    .font(.medium(size: 18))
                
                Text(Config.noteDescription)
                    .foregroundStyle(.white.opacity(0.8))
                    .font(.light(size: 13))
                    .multilineTextAlignment(.leading)
            }
            
            Spacer(minLength: 0.01)
        }
    }
}

#Preview {
    PairTransmitterView(continueTapped: {})
}
