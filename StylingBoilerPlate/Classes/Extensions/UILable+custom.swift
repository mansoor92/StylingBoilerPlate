//
//  UILabel+custom.swift
//  Managin Bundles
//
//  Created by Incubasys on 10/07/2017.
//  Copyright © 2017 Incubasys. All rights reserved.
//

import UIKit


public class AppLabel: UILabel{
   
    @IBInspectable public var isLight: Bool = false
    
    public func config(font: UIFont)  {
        self.font = font
        if isLight{
            self.textColor = UIColor.appColor(color: .LightText)
        }else{
            self.textColor = UIColor.appColor(color: .DarkText)
        }
    }
}

public class TitleLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 18))
    }
}

public class NavigationTitleLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 16))
    }
}

public class HeadlineLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 18))
    }
}

public class SubheadLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 14))
    }
}

public class BodyLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 12))
    }
}

public class CalloutLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 18))
    }
}

public class CaptionLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 18))
    }
}

public class ShoutnoteLabel: AppLabel {
    public override func awakeFromNib() {
        super.config(font: UIFont.appFont(font: .RubikRegular, pontSize: 18))
    }
}
/*
case R-R,L = 48(stats),18(home),16(invite friends earn more),14(jdoe@abc.com)
case R-R,D = 18(invite friends),16(recurring),14(Mehram,Home,ride again with abc?,Paragraph),12(SAR 40-70,Cardholder name)

case R-M,D = 48(stats),36,18(king khalid international),16(name),14(SAR 80)
case R-M,L = 24(distance),16(invite COde),14(search ride,destination),12(Details,06:60Am)

case R-B,D = 20(verification code),14(Cash)

case G-B,L = 18,14
case G,L = 14
case G,D = 14,12
 
case SFU-R,L = 16(Go)
case SFU-R,D = 16(123)
 
case HN,L = 14(datetime)
case HN,D = 12
*/
