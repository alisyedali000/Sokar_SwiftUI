//
//  TestView.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/03/2024.
//

import SwiftUI
import AudioToolbox

struct TestView: View {
    
    @State private var soundIds: [SystemSoundID] = []
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                ForEach(soundIds, id: \.self) { id in
                    
                    Button {
                        AudioServicesPlayAlertSound(id)
                    } label: {
                        ZStack {
                            
                            Rectangle()
                                .foregroundStyle(.green)
                                .frame(height: 40)
                            
                            Text("\(id)")
                        }
                    }

                }
            }
        }
        .onAppear {
            
            for i in 1000...1351 {
                soundIds.append(SystemSoundID(i))
            }
        }
    }
}

#Preview {
    TestView()
}
