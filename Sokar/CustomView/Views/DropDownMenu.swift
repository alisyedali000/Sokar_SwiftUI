//
//  DropDown.swift
//  Innate
//
//  Created by Taimoor Arif on 04/12/2023.
//

import SwiftUI

struct DropDownMenu<Content>: View where Content : View {
    
    var dropdownArray: [String]
    var completion: (String) -> Void
    var view: Content
    
    init(dropdownArray: [String],
         completion: @escaping (String) -> Void,
         @ViewBuilder label: () -> Content) {
        
        self.dropdownArray = dropdownArray
        self.completion = completion
        self.view = label()
    }
    
    var body: some View {
        VStack {
            
            Menu {
                ForEach(dropdownArray, id: \.self) { value in
                    Button(value) {
                        completion(value)
                    }
                }
            } label: {
               view
            }
        }
    }
}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        
        DropDownMenu(dropdownArray: ["0", "1", "2"], completion: {_ in}) {
            Text("select")
        }
    }
}
