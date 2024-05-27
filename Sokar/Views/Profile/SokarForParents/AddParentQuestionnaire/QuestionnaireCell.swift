//
//  QuestionnaireCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct QuestionnaireCell: View {
    
    @State private var showAnswer = false
    
    private var question: QuestionnaireModel
    
    init(question: QuestionnaireModel) {
        self.question = question
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load View
extension QuestionnaireCell {
    
    @ViewBuilder var loadView: some View {
        
        Button(action: {
            
            withAnimation(.smooth(duration: 0.5)) {
                
                self.showAnswer.toggle()
            }
            
        }, label: {
            
            VStack(alignment: .leading) {
                
                topQuestion
                
                if showAnswer {
                    
                    Text(question.answer)
                        .foregroundStyle(.white.opacity(0.7))
                        .font(.light(size: 12))
                        .multilineTextAlignment(.leading)
                }
            }
        })
    }
    
    @ViewBuilder
    var topQuestion: some View {
        
        HStack {
            
            Text(question.question)
                .foregroundStyle(.white)
                .font(.regular(size: 14))
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 12)
                .rotationEffect(.degrees(showAnswer ? 90 : 0))
        }
    }
}

#Preview {
    QuestionnaireCell(question: QuestionnaireModel(question: "What is SOKAR for Parents", answer: "The general shape or figure of a person is defined mainly by the moulding of skeleton and many more "))
}
