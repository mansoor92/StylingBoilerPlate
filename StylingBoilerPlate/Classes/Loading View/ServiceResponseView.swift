//
//  SevericeResponseView.swift
//  71stStreet
//
//  Created by Pantera Engineering on 14/12/2016.
//  Copyright © 2016 Incubasys IT Solutions. All rights reserved.
//

import UIKit

public protocol ServiceResponseViewDelegate {
    func actionRetry()
}

public class ServiceResponseView: UIView, NibLoadableView, CustomView {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: TitleLabel!
    @IBOutlet weak var labelError: TextLabel!
    @IBOutlet weak var btnRetry: UIButton!
    var v: UIView!
    var delegate :ServiceResponseViewDelegate?
    let bundle = Bundle(for: ServiceResponseView.classForCoder())
    var isLight: Bool = false {
        didSet{
          changeTheme(lightTheme: isLight)
        }
    }
    override required public init(frame: CGRect) {
        super.init(frame: frame)
        v = commonInit(bundle: bundle)
        configView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        v = commonInit(bundle: bundle)
        configView()
    }
    
    func configView()  {
        //btnRetry.tintColor = UIColor.appColor(color: .Primary)
        //btnRetry.setTitleColor(UIColor.appColor(color: .Light), for: .normal)
        //btnRetry.backgroundColor = UIColor.appColor(color: .Primary)
        btnRetry.addTarget(self, action: #selector(actionRetry), for: .touchUpInside)
//        changeTheme(lightTheme: isLight)
    }
    
    func changeTheme(lightTheme: Bool)  {
        if lightTheme{
            let color = UIColor.appColor(color: .Dark)
            imageView.tintColor = color
            labelTitle.textColor = color
            labelError.textColor = color
            self.backgroundColor = UIColor.appColor(color: .Light)
        }else{
            let color = UIColor.appColor(color: .Light)
            imageView.tintColor = color
            labelTitle.textColor = color
            labelError.textColor = color
            self.backgroundColor = UIColor.appColor(color: .Dark)
        }
    }
    func actionRetry() {
        delegate?.actionRetry()
    }
    
    func showMessage(title:String?, msg: String?, image: UIImage?, hideRetryButton: Bool) {
        labelTitle.text = title
        labelError.text = msg
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
        if hideRetryButton{
            btnRetry.isHidden = true
        }else{
            btnRetry.isHidden = false
        }
    }//showMessage
}

