//
//  Bundle+StylingBoilerPlate.swift
//  StylingBoilerPlate
//
//  Created by Mansoor Ali on 11/04/2019.
//

import Foundation

extension Bundle{

	static var stylingBoilerPlateBundle: Bundle {
		return Bundle(for: DashedBorderButton.classForCoder())
	}

	static var stringsBundle: Bundle {
		let bundleResourcePath = Bundle.stylingBoilerPlateBundle.resourcePath!
		let assetPath = bundleResourcePath.appending("/StylingBoilerPlaterAssets.bundle")
		return Bundle(path: assetPath)!
	}
}
