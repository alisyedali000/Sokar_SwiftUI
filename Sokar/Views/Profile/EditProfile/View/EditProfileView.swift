//
//  EditProfileView.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct EditProfileView: View {
    
    private struct Config {
        
        static let screenTitle = "Edit Profile"
        
        static let nameTitle = "Name"
        static let namePlchldr = "Enter your name"
        
        static let ageTitle = "Age"
     
        static let height = "Height"
        static let heightUnit = "cm"
        
        static let weight = "Weight"
        static let weightUnit = "KG"
        
        static let buttonTitle = "Update"
    }
    
    @StateObject private var vm = EditProfileVM()
    
    @State private var openPhotos = false
    
    var body: some View {
        
        ZStack {
        
            loadView
            
            if vm.showDatePicker {
                
                AgePickerMLB(showDatePicker: $vm.showDatePicker) { date in
                    
                    vm.age = DateManager.shared.getDateString(from: date)
                }
            }
        }
        .addBackground
        .addNavigationTitle(title: Config.screenTitle)
        .getPhoto(openConfirmationDialog: $openPhotos) { image, _ in
            
            vm.image = image
            vm.base64Image = image.convertToBase64
        }
    }
}

// MARK: Load View
extension EditProfileView {
    
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            imageView
            
            textfields
            
            bottomHeightWeight()
            
            Spacer(minLength: 0.01)
            
            DefaultButton(title: Config.buttonTitle) {
                
            }
        }
        .topHorizontalPadding
    }
}

// MARK: Sub views
extension EditProfileView {
    
    var imageView: some View {
        
        ZStack(alignment: .topTrailing) {
            
            Image(uiImage: vm.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Button {
                self.openPhotos.toggle()
            } label: {
                
                ImageName.editImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
            }
        }
    }
    
    var textfields: some View {
        
        VStack {
            
            CustomTextField(text: $vm.name,
                            title: Config.nameTitle,
                            placeholder: Config.namePlchldr,
                            image: Image(systemName: "person.fill"))
            
            DatePickerTextfield(title: Config.ageTitle,
                                text: vm.age,
                                color: .white,
                                alignment: .leading) {
                
                vm.showDatePicker.toggle()
            }
        }
    }
}

// MARK: Weight, Height
extension EditProfileView {
    
    func bottomHeightWeight() -> some View {
        
        VStack(spacing: 30) {
           
            heightView
            
            weightView
        }
    }
    
    var heightView: some View {
        
        VStack(spacing: 10) {
            
            bottomHeading(title: Config.height,
                         unit: Config.heightUnit)
            
            Text("\(vm.height)")
                .foregroundStyle(.accent)
                .font(.regular(size: 25))
            
            WheelPicker(returnValue: $vm.height,
                        startPoint: 110,
                        endPoint: 190)
            .padding(.top)
        }
    }
    
    var weightView: some View {
        
        VStack(spacing: 10) {
           
            bottomHeading(title: Config.weight,
                         unit: Config.weightUnit)
            
            Text("\(vm.weight)")
                .foregroundStyle(.accent)
                .font(.regular(size: 25))
            
            WheelPicker(returnValue: $vm.weight,
                        startPoint: 30,
                        endPoint: 150)
            .padding(.top)
        }
    }
}

extension EditProfileView {
    
    func bottomHeading(title: String, unit: String) -> some View {
        
        Group {
            
            Text("\(title)")
                .font(.medium(size: 19))
                .foregroundStyle(.white)
            +
            Text("/\(unit)")
                .font(.medium(size: 14))
                .foregroundStyle(.white.opacity(0.7))
        }
        
    }
}

#Preview {
    EditProfileView()
}
