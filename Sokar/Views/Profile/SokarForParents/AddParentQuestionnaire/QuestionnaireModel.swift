//
//  QuestionnaireModel.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import Foundation

enum QuestionnaireType {
    
    case parent
    case child
}

struct QuestionnaireModel: Identifiable, Equatable {
    
    var id = UUID().uuidString
    var question: String
    var answer: String
}

let addParentQuestionnaireArray = [
    
    QuestionnaireModel(question: "What is SOKAR for Parents", answer: "The general shape or figure of a person is defined mainly by the moulding of skeleton and many more."),
    
    QuestionnaireModel(question: "How do I set SOKAR for Parents?", answer: "You need to invite your parent to SOKAR and generate pairing code. Your Parent will download the SOKAR app and then use the code to pair Profiles."),
    
    QuestionnaireModel(question: "What Data will be shared with my Parent?", answer: "Your parent will notify about your daily glucose status. Your Parent will know how to support you in this journey."),
    
    QuestionnaireModel(question: "Can i stop sharing at any time?", answer: "Yes, You can stop data sharing at anytime by just removing your added parent from your profile section."),
    
    QuestionnaireModel(question: "Can I use SOKAR for Parent with anonymous Mode?", answer: "No, You can’t use Sokar for child with anynonymous mode you need to pair for joining."),
    
    QuestionnaireModel(question: "Can my parent edit my data, or see my symptoms or personal notes?", answer: "No, Your parent can’t edit your data he can only track your data."),
]

let addChildQuestionnaireArray = [
    
    QuestionnaireModel(question: "What is SOKAR for Child", answer: "Sokar for child is to add user as a child so that you can track his glucose activities."),
    
    QuestionnaireModel(question: "How do I set SOKAR for child?", answer: "Your child will send you invite code. You will use the code to pair Profiles and to track your child glucose summary."),
    
    QuestionnaireModel(question: "What Data will be shared with me?", answer: "You will notify about your child daily glucose status. You will know how to support your added child in this journey."),
    
    QuestionnaireModel(question: "Can I remove added child anytime?", answer: "Yes, You can remove your added child from your child section of your profile setting."),
    
    QuestionnaireModel(question: "Can I use SOKAR for Parent with anonymous Mode?", answer: "No, You can’t use Sokar for child with anynonymous mode you need to pair for joining."),
    
    QuestionnaireModel(question: "Can I edit my child data, or see symptoms or any personal notes?", answer: "No, You can’t edit your added child data you can only track his data."),
]
