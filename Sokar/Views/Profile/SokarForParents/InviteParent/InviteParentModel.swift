//
//  InviteParentModel.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import Foundation
import SwiftUI

struct InviteParentModel : Identifiable {
    
    var id: Int
    var title: String
    var image: Image
    var description: String
}

let inviteParentsArray = [
    
    InviteParentModel(id: 1, title: "Invite", image: ImageName.inviteParent1, description: "You need to invite your parent to SOKAR and generate pairing code."),
    
    InviteParentModel(id: 2, title: "Pair", image: ImageName.inviteParent2, description: "Your Parent will download the SOKAR app and then use the code to pair Profiles."),
    
    InviteParentModel(id: 3, title: "Share", image: ImageName.inviteParent3, description: "Once the invite and pairing is done you’ll be sharing SOKAR with Parent")
]

let inviteChildArray = [
    
    InviteParentModel(id: 1, title: "Invite", image: ImageName.inviteParent1, description: "Your child will send you invite code."),
    
    InviteParentModel(id: 2, title: "Pair", image: ImageName.inviteParent2, description: "Your child will send you invite code. You will use the code to pair Profiles and to track your child glucose summary."),
    
    InviteParentModel(id: 3, title: "Share", image: ImageName.inviteParent3, description: "Once the invite and pairing is done your child data will be share with you")
]
