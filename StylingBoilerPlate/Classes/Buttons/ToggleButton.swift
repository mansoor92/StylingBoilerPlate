//
//  ToggleButton.swift
//  Managin Bundles
//
//  Created by Incubasys on 12/07/2017.
//  Copyright © 2017 Incubasys. All rights reserved.
//

import UIKit

//height=48, aspectRatio = 17:6
public class ToggleButton: UIButton, Configurable  {
    
    @IBInspectable public var stateSelected: Bool = false{
        didSet{
          toggleState(state: stateSelected)
        }
    }
    @IBInspectable public var selectedStateImage: UIImage!
    @IBInspectable public var unSelectedStateImage: UIImage!
    @IBInspectable public var selectedStateColor: UIColor = UIColor.appColor(color: .Primary)
    @IBInspectable public var unSelectedStateColor: UIColor = UIColor.appColor(color: .Dark)
    
    public var toggleDelegate:Toggleable?
    
    
    private func toggleState(state:Bool){
        print("state:\(state)")
        if state{
            self.setTitleColor(selectedStateColor, for: .normal)
            self.setImage(selectedStateImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }else{
            self.setTitleColor(unSelectedStateColor, for: .normal)
            self.setImage(unSelectedStateImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    public override func awakeFromNib() {
    }
    
    func config()  {
        
        
        self.titleLabel?.font = UIFont.appFont(font: .RubikRegular, pontSize: 16)
        self.titleEdgeInsets.left = 8
        self.titleLabel?.lineBreakMode = .byWordWrapping
        
        self.imageView?.contentMode = .scaleAspectFit
        
        if selectedStateImage == nil || unSelectedStateImage == nil{
            fatalError("selected and Unselected Images are required for ToggleBottomTitelButtona")
        }
        toggleState(state: stateSelected)
        
        self.addTarget(self, action: #selector(actionToggle), for: .touchUpInside)
    }
    
    @objc private func actionToggle()  {
        stateSelected = !stateSelected
        toggleDelegate?.onToggle(stateSelected: stateSelected, sender: self)
    }
}
