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
                                           defaultText : String = "") -> UILabel{
        let label = UILabel()
        label.text = defaultText
        label.setDynamicFontStyle(fontStyle: fontStyle)
        return label
    }
    
    func setDynamicFontStyle(fontStyle : UIFont.TextStyle,
                             sizeToScale : CGFloat){
        let customFont = UIFont.systemFont(ofSize: sizeToScale)
        self.font = UIFontMetrics(forTextStyle: fontStyle).scaledFont(for: customFont)
        self.adjustsFontForContentSizeCategory = true
    }

    func setDynamicFontStyle(fontStyle : UIFont.TextStyle){
        self.font = UIFont.preferredFont(forTextStyle: fontStyle)
        self.adjustsFontForContentSizeCategory = true
    }
    
    func setMinimumScaleFactor(minimumScaleFactor : CGFloat){
        self.minimumScaleFactor = minimumScaleFactor
        self.adjustsFontSizeToFitWidth = true
    }
    
    func allowMultiline(numberOfLines: Int = 0){
        self.numberOfLines = numberOfLines
    }
    
    
}

