//
//  BLERoleSelectViewController.swift
//  BLESensor
//
//  Created by William Wall on 11/11/2019.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

enum BLERole{
    case select
    case central
    case peripheral
}

class BLERoleSelectViewController: UIViewController {

    var onChoice: ((BLERole) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDevice(_ sender: Any) {
        onChoice?(.select)
    }
    
    @IBAction func selectCentral(_ sender: Any) {
        onChoice?(.central)
    }
    
    @IBAction func selectPeripheral(_ sender: Any) {
        onChoice?(.peripheral)
    }
}
