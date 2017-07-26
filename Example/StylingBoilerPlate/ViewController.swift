//
//  ViewController.swift
//  StylingBoilerPlate
//
//  Created by zainincubasys on 07/18/2017.
//  Copyright (c) 2017 zainincubasys. All rights reserved.
//

import UIKit
import StylingBoilerPlate
import MRProgress

class ViewController: UIViewController, ServiceResponseViewDelegate{

    var lv: LoadingBackgroundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lv = self.view as! LoadingBackgroundView
        
        lv.addServiceReponseView(delegate: self, top: 64, bottom: 0)
        lv.showReponseView(title: "Network Error!", msg: "Please check your internet connection and try again", img: UIImage(named: "network"), hideRetryBtn: false)
        let item = UIBarButtonItem(title: "Loading", style: .plain, target: self, action: #selector(showLoading))
        self.navigationItem.leftBarButtonItem = item
        
        let item2 = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(hideLoading))
        self.navigationItem.rightBarButtonItem = item2
    }
    func showLoading()  {
        lv.showLoading(toView: self.view, msg: "Loading Sample", mode: MRProgressOverlayViewMode.determinateCircular)
//
    }
    
    func hideLoading()  {
        lv.hideLoadingOrMessageView()
    }
    
    func actionRetry() {
        showLoading()
    }

}

