//
//  File.swift
//  
//
//  Created by Adan on 27/05/21.
//

import Foundation
import UIKit


public extension UILabel{
    
    static func createLabelWithDynamicFont(fontStyle : UIFont.TextStyle,
                                           defaultText : String = "",
                                           minimumScaleFactor: CGFloat = 0.3,
                                           then : ((UILabel) -> Void)? = nil) -> UILabel{
        let label = UILabel()
        label.text = defaultText
        label.setDynamicFontStyle(fontStyle: fontStyle, mininumScaleFactor : minimumScaleFactor)
        then?(label)
        return label
    }
    
    func setDynamicFontStyle(fontStyle : UIFont.TextStyle, mininumScaleFactor : CGFloat = 0.3){
        self.font = UIFont.preferredFont(forTextStyle: fontStyle)
        self.adjustsFontForContentSizeCategory = true
        self.minimumScaleFactor = mininumScaleFactor
        self.adjustsFontSizeToFitWidth = true
    }
}

