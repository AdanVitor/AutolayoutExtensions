//
//  ComponentsBuilder.swift
//  Dicee-iOS13
//
//  Created by Adan on 20/05/21.

//

import Foundation
import UIKit

public class ComponentsBuilder{
    
    public static func createImageView(image : UIImage?,
                                contentMode : UIView.ContentMode = .scaleAspectFit) -> UIImageView{
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = contentMode
        return imageView
    }
    
    public static func createImageView(imageName : String,
                                contentMode : UIView.ContentMode = .scaleAspectFit) -> UIImageView{
        return createImageView(image: UIImage(named: imageName), contentMode: contentMode)
    }
    
    public static func createButton(title: String = "",
                             type : UIButton.ButtonType = .system,
                             padding : UIEdgeInsets? = nil,
                             then : ((UIButton) -> Void)) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        if let buttonPadding = padding{
            button.contentEdgeInsets = buttonPadding
        }
        then(button)
        return button
    }
}
