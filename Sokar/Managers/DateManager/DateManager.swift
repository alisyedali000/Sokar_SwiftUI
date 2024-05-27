//
//  DateManager.swift
//  Koy
//
//  Created by Taimoor Arif on 10/10/2023.
//

import Foundation

class DateManager {
    
    static let shared = DateManager()
    
    func getDateString(from date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let stringDate = dateFormatter.string(from: date)
        
        return stringDate
    }
    
    func calculateAge(from string: String) -> Int {
        
        let birthDate = stringToDate(from: string)
        let calender = Calendar.current
        
        let ageComponents = calender.dateComponents([.year], from: birthDate, to: Date())
        let age = ageComponents.year!
        return age
    }
    
    func stringToDate(from string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: string) ?? Date()
        return date
    }
    
    func getCellDate(from string: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: string) ?? Date()

        let outformatter = DateFormatter()
        outformatter.dateFormat = "MMM dd, yyyy"
        return outformatter.string(from: date)
    }
    
    func timeInAmPm(from date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let stringDate = dateFormatter.string(from: date)
        
        return stringDate
    }
    
    func timeInAmPm(from str: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: str) ?? Date()

        let outformatter = DateFormatter()
        outformatter.dateFormat = "h:mm a"
        return outformatter.string(from: date)
    }
    
    func utcToLocal(date: Date) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
}

extension String {
    
    var convertBackendDate: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let formattedDate = dateFormatter.string(from: date)
            
            return formattedDate
            
        } else {
            return ""
        }
    }
    
    func toDateString(_ format: String, returnFormat: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = formatter.date(from: self) ?? Date()

        let outformatter = DateFormatter()
        outformatter.dateFormat = returnFormat
        return outformatter.string(from: date)
    }
}

extension Date {
    
    func toString(_ format: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
