//
//  User.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    
    var id = UUID().uuidString
    var name, email: String
    var image: Image
    var dob, weight, height: String
    var diabetesType, gender: String
    var foodPreference: [String]
    
    var age: String {
        
        let myAge = DateManager.shared.calculateAge(from: dob)
        return "\(myAge)"
    }
}

extension User {
    
    init() {
        
        self.name = ""
        self.email = ""
        self.image = Image("")
        self.dob = ""
        self.weight = ""
        self.height = ""
        self.diabetesType = ""
        self.gender = ""
        self.foodPreference = []
    }
    
    init(id: String, name: String, email: String, image: Image) {
        
        self.id = id
        self.name = name
        self.email = email
        self.image = image
        
        self.dob = ""
        self.weight = ""
        self.height = ""
        self.diabetesType = ""
        self.gender = ""
        self.foodPreference = []
    }
}

var userMock = User(name: "Chris Ashley", email: "chrisashley123@gmail.com", image: Image(systemName: "person.circle.fill"), dob: "1995-05-10", weight: "67", height: "157", diabetesType: "Type2", gender: "Male", foodPreference: ["Vegetarian", "Keto", "Vegan", "Low carbs", ])

var userMockArray = [

    User(id: "1", name: "Aima Ahmad", email: "aimaahmad123@gmail.com", image: Image(systemName: "person.circle.fill")),
    
    User(id: "2", name: "Alexander Albert", email: "alexander@gmail.com", image: Image(systemName: "person.circle.fill"))
]

struct GlucoseModel: Identifiable {
    
    var id = UUID().uuidString
    
    var time: String
    var value: Int
    
    var animate : Bool = false
    
    var date: Date {
        
        return DateManager.shared.stringToDate(from: time)
    }
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.minute, .weekday,
             .month,
             .day,
             .year],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
}

var glucoseMock = GlucoseModel(time: "2024-04-29 12:13:14", value: 120)

var glucoseHourMockArray = [
    
    GlucoseModel(time: "2024-04-01 12:04:14", value: 120),
    GlucoseModel(time: "2024-04-01 12:08:14", value: 140),
    GlucoseModel(time: "2024-04-01 12:14:14", value: 180),
    GlucoseModel(time: "2024-04-01 12:18:14", value: 130),
    GlucoseModel(time: "2024-04-01 12:22:14", value: 210),
    GlucoseModel(time: "2024-04-01 12:25:14", value: 110),
    GlucoseModel(time: "2024-04-01 13:02:01", value: 175),
    GlucoseModel(time: "2024-04-01 13:10:14", value: 128),
    GlucoseModel(time: "2024-04-01 13:14:14", value: 180),
    GlucoseModel(time: "2024-04-01 13:19:14", value: 200),
    GlucoseModel(time: "2024-04-01 13:22:14", value: 120),
    GlucoseModel(time: "2024-04-01 13:25:14", value: 140),
    GlucoseModel(time: "2024-04-01 14:10:14", value: 180),
    GlucoseModel(time: "2024-04-01 14:19:14", value: 130),
    GlucoseModel(time: "2024-04-01 14:27:14", value: 210),
    GlucoseModel(time: "2024-04-01 14:31:14", value: 108),
    GlucoseModel(time: "2024-04-01 14:35:14", value: 160),
    GlucoseModel(time: "2024-04-01 14:42:14", value: 145),
    GlucoseModel(time: "2024-04-01 14:48:14", value: 160),
    GlucoseModel(time: "2024-04-01 14:55:14", value: 200)
]

var glucoseSingleDayMockArray = [
    
    GlucoseModel(time: "2024-04-01 02:04:14", value: 120),
    GlucoseModel(time: "2024-04-01 05:29:14", value: 140),
    GlucoseModel(time: "2024-04-01 07:57:14", value: 150),
    GlucoseModel(time: "2024-04-01 08:48:14", value: 120),
    GlucoseModel(time: "2024-04-01 09:08:14", value: 185),
    GlucoseModel(time: "2024-04-01 11:36:14", value: 110),
    GlucoseModel(time: "2024-04-01 11:59:14", value: 145),
    GlucoseModel(time: "2024-04-01 12:28:14", value: 128),
    GlucoseModel(time: "2024-04-01 12:49:14", value: 180),
    GlucoseModel(time: "2024-04-01 13:11:14", value: 200),
    GlucoseModel(time: "2024-04-01 15:13:14", value: 175),
    GlucoseModel(time: "2024-04-01 16:14:14", value: 140),
    GlucoseModel(time: "2024-04-01 18:25:14", value: 180),
    GlucoseModel(time: "2024-04-01 20:48:14", value: 130),
    GlucoseModel(time: "2024-04-01 21:08:14", value: 202),
    GlucoseModel(time: "2024-04-01 21:36:14", value: 127),
    GlucoseModel(time: "2024-04-01 21:59:14", value: 148),
    GlucoseModel(time: "2024-04-01 22:28:14", value: 128),
    GlucoseModel(time: "2024-04-01 22:49:14", value: 180),
    GlucoseModel(time: "2024-04-01 23:59:14", value: 200)
]

var glucoseDayMockArray = [
    
    GlucoseModel(time: "2024-04-01 02:04:14", value: 120),
    GlucoseModel(time: "2024-04-01 08:29:14", value: 140),
    GlucoseModel(time: "2024-04-01 12:57:14", value: 180),
    GlucoseModel(time: "2024-04-01 16:48:14", value: 130),
    GlucoseModel(time: "2024-04-01 20:08:14", value: 158),
    GlucoseModel(time: "2024-04-02 01:36:14", value: 110),
    GlucoseModel(time: "2024-04-02 08:59:14", value: 175),
    GlucoseModel(time: "2024-04-02 09:28:14", value: 128),
    GlucoseModel(time: "2024-04-02 11:49:14", value: 180),
    GlucoseModel(time: "2024-04-02 13:11:14", value: 167),
    GlucoseModel(time: "2024-04-02 15:13:14", value: 151),
    GlucoseModel(time: "2024-04-02 18:14:14", value: 140),
    GlucoseModel(time: "2024-04-02 22:25:14", value: 180),
    GlucoseModel(time: "2024-04-03 03:48:14", value: 130),
    GlucoseModel(time: "2024-04-03 06:08:14", value: 154),
    GlucoseModel(time: "2024-04-03 11:36:14", value: 120),
    GlucoseModel(time: "2024-04-03 14:59:14", value: 175),
    GlucoseModel(time: "2024-04-03 19:28:14", value: 128),
    GlucoseModel(time: "2024-04-03 22:49:14", value: 190),
    GlucoseModel(time: "2024-04-03 23:59:14", value: 200)
]

var glucoseWeekMockArray = [
    
    GlucoseModel(time: "2024-04-01 11:04:14", value: 120),
    GlucoseModel(time: "2024-04-01 11:29:14", value: 140),
    GlucoseModel(time: "2024-04-02 12:57:14", value: 190),
    GlucoseModel(time: "2024-04-02 13:48:14", value: 130),
    GlucoseModel(time: "2024-04-03 14:08:14", value: 210),
    GlucoseModel(time: "2024-04-03 14:36:14", value: 110),
    GlucoseModel(time: "2024-04-03 14:59:14", value: 178),
    GlucoseModel(time: "2024-04-04 15:28:14", value: 128),
    GlucoseModel(time: "2024-04-04 15:49:14", value: 182),
    GlucoseModel(time: "2024-04-04 16:11:14", value: 200),
    GlucoseModel(time: "2024-04-04 17:13:14", value: 170),
    GlucoseModel(time: "2024-04-05 17:14:14", value: 140),
    GlucoseModel(time: "2024-04-05 18:25:14", value: 180),
    GlucoseModel(time: "2024-04-05 18:48:14", value: 149),
    GlucoseModel(time: "2024-04-05 19:08:14", value: 156),
    GlucoseModel(time: "2024-04-05 19:36:14", value: 110),
    GlucoseModel(time: "2024-04-05 19:59:14", value: 175),
    GlucoseModel(time: "2024-04-06 20:28:14", value: 128),
    GlucoseModel(time: "2024-04-06 21:49:14", value: 198),
    GlucoseModel(time: "2024-04-06 21:59:14", value: 200)
]

var glucoseMonthMockArray = [
    
    GlucoseModel(time: "2024-01-01 11:04:14", value: 120),
    GlucoseModel(time: "2024-01-02 11:29:14", value: 140),
    GlucoseModel(time: "2024-01-06 12:57:14", value: 180),
    GlucoseModel(time: "2024-01-08 13:48:14", value: 199),
    GlucoseModel(time: "2024-01-11 14:08:14", value: 156),
    GlucoseModel(time: "2024-01-13 14:36:14", value: 110),
    GlucoseModel(time: "2024-01-17 14:59:14", value: 175),
    GlucoseModel(time: "2024-01-19 15:28:14", value: 171),
    GlucoseModel(time: "2024-01-20 15:49:14", value: 180),
    GlucoseModel(time: "2024-01-21 16:11:14", value: 200),
    GlucoseModel(time: "2024-01-22 17:13:14", value: 179),
    GlucoseModel(time: "2024-01-23 17:14:14", value: 140),
    GlucoseModel(time: "2024-01-25 18:25:14", value: 180),
    GlucoseModel(time: "2024-01-27 18:48:14", value: 130),
    GlucoseModel(time: "2024-01-28 19:08:14", value: 150),
    GlucoseModel(time: "2024-01-28 19:36:14", value: 110),
    GlucoseModel(time: "2024-01-28 19:59:14", value: 175),
    GlucoseModel(time: "2024-01-29 20:28:14", value: 128),
    GlucoseModel(time: "2024-01-29 21:49:14", value: 143),
    GlucoseModel(time: "2024-01-31 21:11:14", value: 200)
]

var glucoseSixMonthMockArray = [
    
    GlucoseModel(time: "2023-01-01 11:04:14", value: 120),
    GlucoseModel(time: "2023-01-15 11:29:14", value: 140),
    GlucoseModel(time: "2023-01-22 12:57:14", value: 180),
    GlucoseModel(time: "2023-02-03 13:48:14", value: 130),
    GlucoseModel(time: "2023-02-11 14:08:14", value: 149),
    GlucoseModel(time: "2023-02-21 14:36:14", value: 110),
    GlucoseModel(time: "2023-03-05 14:59:14", value: 175),
    GlucoseModel(time: "2023-03-12 15:28:14", value: 134),
    GlucoseModel(time: "2023-03-17 15:49:14", value: 180),
    GlucoseModel(time: "2023-03-23 16:11:14", value: 200),
    GlucoseModel(time: "2023-03-26 17:13:14", value: 158),
    GlucoseModel(time: "2023-03-30 17:14:14", value: 140),
    GlucoseModel(time: "2023-04-16 18:25:14", value: 180),
    GlucoseModel(time: "2023-06-09 18:48:14", value: 116),
    GlucoseModel(time: "2023-06-16 19:08:14", value: 165),
    GlucoseModel(time: "2023-06-27 19:36:14", value: 158),
    GlucoseModel(time: "2023-07-02 19:59:14", value: 175),
    GlucoseModel(time: "2023-07-13 20:28:14", value: 128),
    GlucoseModel(time: "2023-07-24 21:49:14", value: 168),
    GlucoseModel(time: "2023-09-10 21:11:14", value: 200)
]

var glucoseYearMockArray = [
    
    GlucoseModel(time: "2021-05-01 11:04:14", value: 120),
    GlucoseModel(time: "2021-10-01 11:29:14", value: 140),
    GlucoseModel(time: "2021-12-01 12:57:14", value: 180),
    GlucoseModel(time: "2022-02-01 13:48:14", value: 130),
    GlucoseModel(time: "2022-08-01 14:08:14", value: 201),
    GlucoseModel(time: "2023-01-01 14:36:14", value: 145),
    GlucoseModel(time: "2023-03-01 14:59:14", value: 175),
    GlucoseModel(time: "2023-03-01 15:28:14", value: 154),
    GlucoseModel(time: "2023-04-01 15:49:14", value: 180),
    GlucoseModel(time: "2023-07-01 16:11:14", value: 200),
    GlucoseModel(time: "2023-09-01 17:13:14", value: 155),
    GlucoseModel(time: "2023-09-01 17:14:14", value: 140),
    GlucoseModel(time: "2023-10-01 18:25:14", value: 185),
    GlucoseModel(time: "2023-10-01 18:48:14", value: 130),
    GlucoseModel(time: "2023-11-01 19:08:14", value: 135),
    GlucoseModel(time: "2024-01-01 19:36:14", value: 158),
    GlucoseModel(time: "2024-01-01 19:59:14", value: 175),
    GlucoseModel(time: "2024-01-01 20:28:14", value: 146),
    GlucoseModel(time: "2024-03-01 21:49:14", value: 185),
    GlucoseModel(time: "2024-05-01 21:11:14", value: 200)
]

#Preview {
    
//    UserDetailView(user: userMock)
    ContentView()
}
