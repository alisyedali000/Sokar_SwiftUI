//
//  AddParentQuestionnaire.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct AddParentQuestionnaire: View {
    
    private struct Config {
        
        static let topTitle = "Your Question Asked"
    }
    
    private var type: QuestionnaireType
    
    init(type: QuestionnaireType) {
        self.type = type
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load View
extension AddParentQuestionnaire {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(alignment: .leading) {
            
            Text(Config.topTitle)
                .font(.medium(size: 18))
                .foregroundStyle(.white)
            
            allQuestions
        }
        .padding(10)
        .background {
            
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
}

extension AddParentQuestionnaire {
    
    @ViewBuilder
    var allQuestions: some View {
        
        VStack {
            
            ForEach(type == .parent ? addParentQuestionnaireArray : addChildQuestionnaireArray) { question in
                
                VStack {
                    
                    QuestionnaireCell(question: question)
                        .padding(.top, 5)
                    
                    if question != addParentQuestionnaireArray.last {
                        
                        Rectangle()
                            .foregroundStyle(.white.opacity(0.09))
                            .frame(height: 1)
                    }
                }
            }
        }
    }
}

#Preview {
    AddParentQuestionnaire(type: .child)
}
