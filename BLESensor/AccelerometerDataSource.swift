//
//  AccelerometerDataSource.swift
//  BLESensor
//
//  Created by William Wall on 12/11/2019.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

struct AccelerometerData: Codable {
    let timestamp: TimeInterval
    let x: Double
    let y: Double
    let z: Double
}

protocol AccelerometerDataSource {
    var onUpdate: ((AccelerometerData) -> Void)?{get set}
    
    func start()
    func stop()
}
