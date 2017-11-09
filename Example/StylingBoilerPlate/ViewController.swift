//
//  ViewController.swift
//  StylingBoilerPlate
//
//  Created by zainincubasys on 07/18/2017.
//  Copyright (c) 2017 zainincubasys. All rights reserved.
//

import UIKit
import StylingBoilerPlate

class ViewController: UIViewController, ToggleViewDelegate{
    
    @IBOutlet weak var btn: ToggleButton!
     @IBOutlet weak var btnView: ToggleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnView.toggeable = self
        btnView.selectedStateImg = #imageLiteral(resourceName: "cash-circle")
        btnView.unSelectedStateImg = #imageLiteral(resourceName: "wallet-card")
    }

    func viewToggled(state: Bool, view: ToggleView) {
        if state{
            btnView.title.text = "Mehram Ride"
            btnView.title.numberOfLines = 2
        }else{
            btnView.title.numberOfLines = 1
            btnView.title.text = "Wallet"
        }
    }
}

