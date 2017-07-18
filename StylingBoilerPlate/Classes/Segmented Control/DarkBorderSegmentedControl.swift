import UIKit

public class DarkBorderSegmentedControl: UISegmentedControl {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override func awakeFromNib() {
        setup()
    }
    
    //setup
    func setup()  {
        sharpCornersStyle(normalBackgroudColor: UIColor.clear, selectedBackggroundColor: UIColor.appColor(color: .Secondary), tintColor: UIColor.appColor(color: .Dark), selectedTextColor: UIColor.appColor(color: .Light))
    }
    
    func sharpCornersStyle(normalBackgroudColor:UIColor,selectedBackggroundColor:UIColor,tintColor:UIColor,selectedTextColor:UIColor) {
        self.setBackgroundImage(UIImage.getImageFromColor(color: normalBackgroudColor, size: CGSize(width: 200, height: 200)), for: UIControlState.normal, barMetrics: .default)
        self.tintColor = tintColor
        self.setBackgroundImage(UIImage.getImageFromColor(color: selectedBackggroundColor, size: CGSize(width: 200, height: 200)), for: UIControlState.selected, barMetrics: .default)
        let titleTextAttributes = [NSForegroundColorAttributeName: selectedTextColor]
        self.setTitleTextAttributes(titleTextAttributes, for: .selected)
        self.backgroundColor = normalBackgroudColor
        self.layer.cornerRadius = 0
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = tintColor.cgColor
    }
    

}
