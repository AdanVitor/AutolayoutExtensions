//
//  File.swift
//  
//
//  Created by Adan on 27/05/21.
//

import Foundation
import UIKit


public extension UILabel{
    
    static func createDynamicFontLabel(fontStyle : UIFont.TextStyle, defaultText : String = "", then : ((UILabel) -> Void)? = nil) -> UILabel{
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: fontStyle)
        label.adjustsFontForContentSizeCategory = true
        label.text = defaultText
        label.minimumScaleFactor = 0.3
        label.adjustsFontSizeToFitWidth = true
        then?(label)
        return label
    }
}

