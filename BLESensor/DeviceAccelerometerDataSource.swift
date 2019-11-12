//
//  DeviceAccelerometerDataSource.swift
//  BLESensor
//
//  Created by William Wall on 12/11/2019.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation
import CoreMotion

class DeviceAccelerometerDataSource: AccelerometerDataSource{
    
    var onUpdate: ((AccelerometerData) -> Void)?
    
    private let manager = CMMotionManager()
    
    func start() {
        guard manager.isAccelerometerAvailable else{
            print("Accelerometer is not available")
            return
        }
        if manager.isAccelerometerActive {return}
        
        manager.accelerometerUpdateInterval = 1.0
        manager.startAccelerometerUpdates(to: OperationQueue.main){(data, error) in
            if let error = error{
                print("Error accelerometer updates: \(error.localizedDescription)")
            }else if let data = data{
                print("Accelerometer data: \(data)")
                let accelerometerData = AccelerometerData(timestamp: data.timestamp, x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
                self.onUpdate?(accelerometerData)
            }
        }
    }
    
    func stop() {
        manager.startAccelerometerUpdates()
    }
    
    
}
