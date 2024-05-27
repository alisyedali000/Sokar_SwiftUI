//
//  ConnectedDevices.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import Foundation

struct ConnectedDevices: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var image: String
}

let connectedDeviceMock = ConnectedDevices(name: "Glucose Measuring Device", image: "tray.circle.fill")

let connectedDevicesMockArray = [
    
    ConnectedDevices(name: "Glucose Measuring Device", image: "tray.circle.fill"),
    ConnectedDevices(name: "BP Measuring Device", image: "tray.circle.fill")
]
