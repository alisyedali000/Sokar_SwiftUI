//
//  SokarForParentsView.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct SokarForParentsView: View {
    
    private struct Config {
        
        static let topTitle = "Get ready for enjoy SOKAR together"
        static let topDescription = "Share your diabetic management journey with your Parent"
        
        static let checkboxesArray = ["Your Parent will know how to support you in this journey", "Your parent will notify about your daily glucose status", "Your Parent can track your daily insights"]
        
        static let parentsSeeDetails = "With SOKAR your parent can easily track your glucose Ups and Download through notification "
        
        static let parentClued = "Get Your Parent Clued Up On You"
        
        static let buttonTitle = "Link Your Parent"
    }
    
    @State private var mobileAnimation = false
    @State private var graphAnimation = false
    @State private var questionnaireAnimation = false
    @State private var inviteStepsAnimation = false
    
    var body: some View {
        
        loadView
            .addBackground
    }
}

// MARK: Load View
extension SokarForParentsView {
    
    var loadView: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
             
                screenDetails
                
                NavigationDefaultButton(title: Config.buttonTitle) {
                    
                    SharingCodeView()
                }
            }
            .topHorizontalPadding
        }
        .scrollIndicators(.hidden)
    }
}

// MARK: Sub Views
extension SokarForParentsView {
    
    @ViewBuilder
    var screenDetails: some View {
        
        LazyVStack(spacing: 20) {
            
            Group {
                
                Text("SOKAR")
                    .foregroundStyle(.accent)
                +
                Text(" For Parents")
                    .foregroundStyle(.white)
            }
            .font(.medium(size: 25))
            
            enjoySokarText
            
            checkboxesText
            
            parentSeeText
            
            mobileImage
            
            heartRateView
            
            questionnaire
            
            inviteSteps
        }
    }
    
    @ViewBuilder
    var enjoySokarText: some View {
        
        VStack(spacing: 5) {
            
            Text(Config.topTitle)
                .foregroundStyle(.white)
                .font(.medium(size: 18))
                .multilineTextAlignment(.center)
            
            Text(Config.topDescription)
                .font(.light(size: 15))
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
    }
    
    @ViewBuilder
    var checkboxesText: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                ForEach(Config.checkboxesArray, id: \.self) { text in
                    
                    checkboxCell(text)
                }
            }
            
            Spacer(minLength: 0.01)
        }
    }
    
    @ViewBuilder
    func checkboxCell(_ text: String) -> some View {
        
        HStack(alignment: .top) {
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.accent)
                .padding(.top, 5)
            
            Text(text)
                .foregroundStyle(.white.opacity(0.7))
                .font(.light(size: 14))
        }
    }
    
    @ViewBuilder
    var parentSeeText: some View {
        
        VStack(spacing: 5) {
            
            Group {
                
                Text("What ")
                    .foregroundStyle(.accent)
                +
                Text("Your Parent See??")
                    .foregroundStyle(.white)
            }
            .font(.medium(size: 18))
            
            Text(Config.parentsSeeDetails)
                .font(.regular(size: 13))
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
    }
}

// MARK: Mobile Screen
extension SokarForParentsView {
    
    @ViewBuilder
    var mobileImage: some View {
        
        Group {
            
            ImageName.mobileScreen
                .resizable()
                .scaledToFit()
                .frame(width: 239, height: UIScreen.main.bounds.height / 2)
                .swipeAnimation(startAnimation: mobileAnimation, xOffset: -1)
                .onAppear(perform: {
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        
                        mobileAnimation = true
                    }
                })
        }
    }
    
    @ViewBuilder
    var heartRateView: some View {
        
        Group {
            // swipe animation was not working, so adding this
            if mobileAnimation {
                
                VStack {
                    
                    Text(Config.parentClued)
                        .foregroundStyle(.white)
                        .font(.medium(size: 18))
                    
                    ImageName.addParentHeartRate
                        .resizable()
                        .scaledToFit()
                        .frame(height: 340)
                }
                .swipeAnimation(startAnimation: graphAnimation, xOffset: 1)
                .onAppear(perform: {
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        
                        graphAnimation = true
                    }
                })
            }
        }
    }
    
    @ViewBuilder
    var questionnaire: some View {
        
        Group {
            // swipe animation was not working, so adding this
            if mobileAnimation {
                
                AddParentQuestionnaire(type: .parent)
                    .swipeAnimation(startAnimation: questionnaireAnimation, xOffset: -1)
                    .onAppear(perform: {
                        
                        withAnimation(.smooth(duration: 0.5)) {
                            
                            questionnaireAnimation = true
                        }
                    })
            }
        }
    }
    
    @ViewBuilder
    var inviteSteps: some View {
        
        Group {
            // swipe animation was not working, so adding this
            if mobileAnimation {
                
                InviteParentView(type: .parent)
                    .swipeAnimation(startAnimation: inviteStepsAnimation, xOffset: 1)
                    .onAppear(perform: {
                        
                        withAnimation(.smooth(duration: 0.5)) {
                            
                            inviteStepsAnimation = true
                        }
                    })
            }
        }
    }
}

#Preview {
    SokarForParentsView()
}
