//
//  DiscoveryViewController.swift
//  BLESensor
//
//  Created by William Wall on 11/11/2019.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class DiscoveryViewController: UITableViewController {
    
    var central: BLECentral!
    var onConnected: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        central = BLECentral()
        central.onDiscovered = {[weak self] in
            self?.tableView.reloadData()
        }
        central?.onConnected = {[weak self] in
            self?.onConnected?()
        }
        
        tableView.register(UINib(nibName: "DiscoveredPeripheralCell", bundle: nil), forCellReuseIdentifier: "DiscoveredPeripheralCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return central.discoveredPeripherals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoveredPeripheralCell", for: indexPath) as! DiscoveredPeripheralCell
        let discoveredPeripheral = central.discoveredPeripherals[indexPath.row]
        cell.identifierLabel.text = discoveredPeripheral.peripheral.identifier.uuidString
        cell.rssiLabel.text = discoveredPeripheral.rssi.stringValue
        cell.advertisementLabel.text = discoveredPeripheral.advertisementData.debugDescription
        cell.identifierLabel.textColor = .blue
        cell.rssiLabel.textColor = .red
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        central.connect(at: indexPath.row)
    }
    
}
