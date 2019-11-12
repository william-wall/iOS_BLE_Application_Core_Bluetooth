//
//  DiscoveredPeripheral.swift
//  BLESensor
//
//  Created by William Wall on 11/11/2019.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import CoreBluetooth

class DiscoveredPeripheral {
    var peripheral: CBPeripheral
    var rssi: NSNumber
    var advertisementData: [String: Any]
    
    init(peripheral: CBPeripheral, rssi: NSNumber, advertisementData: [String: Any]) {
        self.peripheral = peripheral
        self.rssi = rssi
        self.advertisementData = advertisementData
    }
    
}
