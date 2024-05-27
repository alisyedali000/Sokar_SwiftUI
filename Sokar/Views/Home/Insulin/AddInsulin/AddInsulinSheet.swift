//
//  AddInsulinSheet.swift
//  Sokar
//
//  Created by Taimoor Arif on 09/05/2024.
//

import SwiftUI

struct AddInsulinSheet: View {
    
    private struct Config {
        
        static let title = "Add Insulin"
        
        static let insulinTitle = "Insulin"
        static let inslinUnit = "/units"
        
        static let addTimeTitle = "Add Time"
        static let timeTitle = "Time"
        
        static let glucoseTitle = "Glucose"
        static let buttonTitle = "Add"
    }
    
    @State private var insulineUnits = "1"
    @State private var time = Date()
    @State private var glucose = "15"
    
    private var dropdownArray = (1...10).map { String($0) }
    
    private var addAction: () -> Void
    
    init(addAction: @escaping () -> Void) {
        
        self.addAction = addAction
    }
    
    var body: some View {
        
        loadView
            .addBackgroundColor(color: Color.sheetBackground)
            .addSheetHeight(detents: [.fraction(0.8)])
    }
}

// MARK: Load view
extension AddInsulinSheet {
    
    @ViewBuilder
    var loadView: some View {
        
        ScrollView {
            
            VStack(spacing: 15) {
                
                title
                
                insulinUnits
                
                addTime
                
                glucoseView
                
                Spacer(minLength: 0.01)
                
                DefaultButton(title: Config.buttonTitle) {
                   addAction()
                }
            }
            .topHorizontalPadding
        }
        .scrollIndicators(.hidden)
    }
}

// MARK: Load View
extension AddInsulinSheet {
    
    @ViewBuilder
    var title: some View {
        
        Text(Config.title)
            .font(.medium(size: 20))
            .foregroundStyle(.white)
    }
    
    @ViewBuilder
    var insulinUnits: some View {
        
        VStack(alignment: .leading) {
            
         //  title
            Group {
            
                Text(Config.insulinTitle)
                    .foregroundStyle(.white)
                    .font(.medium(size: 16))
                +
                Text(Config.inslinUnit)
                    .foregroundStyle(.white.opacity(0.6))
                    .font(.medium(size: 14))
            }
            
            DropDownMenu(dropdownArray: dropdownArray) { returnValue in
                
                self.insulineUnits = returnValue
                
            } label: {
                
                DropdownTextField(text: insulineUnits,
                                  textColor: .accentColor,
                                  backgroundColor: .white.opacity(0.1))
            }
        }
    }
    
    @ViewBuilder
    var addTime: some View {
        
        VStack(alignment: .leading) {
            
            Text(Config.addTimeTitle)
                .font(.medium(size: 16))
                .foregroundStyle(.white)
            
            TimePicker(time: $time)
        }
    }
    
    @ViewBuilder
    var glucoseView: some View {
        
        VStack {
            
            CustomTextField(text: $glucose,
                            title: Config.glucoseTitle,
                            placeholder: "Enter your glucose",
                            image: Image(""),
                            keyboardType: .numberPad)
        }
        .addDoneButton
    }
}

#Preview {
//    AddInsulinSheet(addAction: {})
    HomeView()
}
