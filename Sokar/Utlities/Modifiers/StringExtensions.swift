//
//  StringExtensions.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

extension String {
    
    var isEmptyOrWhitespace: Bool {
        
        // Check empty string
        if self.isEmpty {
            return true
        }
        // Trim and check empty string
        return (self.trimmingCharacters(in: .whitespacesAndNewlines) == "")
    }
    
    var addPercentageEncoding: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    var isValueEmpty: Bool {
        
        if self.isEmpty || self.isEmptyOrWhitespace {
            return true
        }
        
        return false
    }
    
    var isValidEmail: Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

extension String {
    
    func getWords(prefix: Int) -> String {
        
        let words = self.components(separatedBy: " ")
        
        let prefixWords = words.prefix(prefix)
        
        let result = prefixWords.joined(separator: " ")
        
        return result
    }
    
    var trimText: String {
        
        let trimMessage = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimMessage
    }
}

extension Text {
    
    func concatenate(components: [String]) -> Text {
        var resultText = Text("")
        for (index, component) in components.enumerated() {
            if index % 2 == 0 {
                resultText = resultText + Text(component)
            } else {
                resultText = resultText + Text(component).bold()
            }
        }
        return resultText
    }
}

func formatTextWithBold(_ text: String) -> Text {
    let components = text.components(separatedBy: "**")
    return Text("").concatenate(components: components)
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}
