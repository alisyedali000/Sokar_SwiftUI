//
//  InviteParentView.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct InviteParentView: View {
    
    private struct Config {
        
        static let topTitle = "Here's How to invite your Parent"
    }
   
    private var inviteParents = inviteParentsArray
    private var inviteChild = inviteChildArray

    private var type: QuestionnaireType
    
    init(type: QuestionnaireType) {
        
        self.type = type
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load View
extension InviteParentView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(alignment: .leading) {
            
            Text(Config.topTitle)
                .foregroundStyle(.white)
                .font(.medium(size: 18))
            
            allPoints
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        .background {
            
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
}

extension InviteParentView {
    
    @ViewBuilder
    var allPoints: some View {
        
        VStack(spacing: 20) {
            
            ForEach(type == .parent ? inviteParents : inviteChild) { point in
                
               pointCell(point)
            }
        }
    }
    
    @ViewBuilder
    func pointCell(_ point: InviteParentModel) -> some View {
        
        HStack(spacing: 10) {
            
            point.image
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 58)
            
            VStack(alignment: .leading) {
                
                Text("\(point.id).\(point.title)")
                    .foregroundStyle(.white)
                    .font(.regular(size: 15))
                
                Text(point.description)
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.light(size: 12))
                    .multilineTextAlignment(.leading)
            }
            
            Spacer(minLength: 0.01)
        }
    }
}

#Preview {
    InviteParentView(type: .parent)
}
