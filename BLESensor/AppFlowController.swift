//
//  AppFlowController.swift
//  BLESensor
//
//  Created by William Wall on 11/11/2019.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class AppFlowController {
    
    let window : UIWindow
    var central: BLECentral?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BLERoleSelectViewController") as!
            BLERoleSelectViewController
        viewController.onChoice = {[weak self] choice in
            let nextViewController: UIViewController
            switch choice {
            case .select:
                nextViewController = SelectViewController()
                print("Select")
            case .central:
                let viewController = DiscoveryViewController()
                viewController.onConnected = {
                    let accelerometerViewController = AccelerometerViewController()
                    accelerometerViewController.central = viewController.central
                    self?.window.rootViewController = accelerometerViewController
                }
                nextViewController = viewController
            case .peripheral:
                nextViewController = PeripheralViewController()
            }
            self?.window.rootViewController = nextViewController
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
