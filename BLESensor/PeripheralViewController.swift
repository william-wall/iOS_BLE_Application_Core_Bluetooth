//
//  PeripheralViewController.swift
//  BLESensor
//
//  Created by William Wall on 11/11/2019.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class PeripheralViewController: UIViewController {
    
    var peripheral: BLEPeripheral!

    override func viewDidLoad() {
        super.viewDidLoad()

        peripheral = BLEPeripheral(dataSource: DeviceAccelerometerDataSource())
        
    }
    


}
