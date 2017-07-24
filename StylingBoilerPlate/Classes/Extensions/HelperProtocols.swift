//
//  StoryBoardLoabableView.swift
//  Pods
//
//  Created by Incubasys on 24/07/2017.
//
//

import UIKit

public protocol StoryBoardLoadableView{}
public extension StoryBoardLoadableView where Self: UIViewController{
    public static var sceneName: String {
        let vc = String(describing: self)
        let str = vc.replacingOccurrences(of: "ViewController", with: "Scene")
        return str
    }
}

//Load view from xib file
public protocol CustomView{
    init(frame: CGRect)
}
public extension CustomView where Self: UIView, Self: NibLoadableView{
    public var view: UIView{
        print(Self.nibName)
        let nib = Bundle.main.loadNibNamed(Self.nibName, owner: self, options: nil)
        let tempView = nib?.first as? UIView
        guard (tempView) != nil else {
            let view =  UIView()
            view.backgroundColor = UIColor.red
            return view
        }
        tempView!.frame = self.bounds
        tempView!.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        return tempView!
    }
    
    public func commonInit()  {
        self.addSubview(view)
    }
    
    
}
