//
//  ColorCollectionViewCell.swift
//  Managin Bundles
//
//  Created by Incubasys on 11/07/2017.
//  Copyright © 2017 Incubasys. All rights reserved.
//

import UIKit
import StylingBoilerPlate

struct ColorInfo {
    var colorName: String
    var color: UIColor
    var hexcode: String
    var rgba: String
    
    init(color:Color) {
        self.colorName = color.rawValue
        self.color = UIColor.appColor(color: color)
        self.hexcode = self.color.toHexString()
        self.rgba = self.color.toRgbaString()
    }
    
    static func allColorsInfo() -> [ColorInfo]{
        var allColorsInfoArray = [ColorInfo]()
        allColorsInfoArray.append(ColorInfo(color: .Light))
        allColorsInfoArray.append(ColorInfo(color: .Dark))
        allColorsInfoArray.append(ColorInfo(color: .LightText))
        allColorsInfoArray.append(ColorInfo(color: .DarkText))
        allColorsInfoArray.append(ColorInfo(color: .Primary))
        allColorsInfoArray.append(ColorInfo(color: .Secondary))
        allColorsInfoArray.append(ColorInfo(color: .Constructive))
        allColorsInfoArray.append(ColorInfo(color: .Destructive))
        return allColorsInfoArray
    }
}
class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorPreview: UIView!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var hexCode: UILabel!
    @IBOutlet weak var rgba: UILabel!
    
    override func awakeFromNib() {
        colorPreview.layer.borderWidth = 1
        colorPreview.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    }
    func config(colorInfo: ColorInfo)  {
        colorPreview.backgroundColor = colorInfo.color
        colorName.text = colorInfo.colorName
        hexCode.text = colorInfo.hexcode
        rgba.text = colorInfo.rgba
        colorName.text = colorInfo.colorName
    }
}
