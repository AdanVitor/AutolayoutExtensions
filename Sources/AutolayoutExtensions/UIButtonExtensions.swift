//
//  File.swift
//  
//
//  Created by Adan on 27/05/21.
//

import Foundation
import UIKit

public extension UIButton{
    
    static func createButton(title: String = "",
                             type : UIButton.ButtonType = .system,
                             padding : UIEdgeInsets? = nil,
                             then : ((UIButton) -> Void)? = nil) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        if let buttonPadding = padding{
            button.contentEdgeInsets = buttonPadding
        }
        then?(button)
        return button
    }
    
}

