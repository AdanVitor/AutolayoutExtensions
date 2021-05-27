//
//  File.swift
//  
//
//  Created by Adan on 27/05/21.
//

import Foundation
import UIKit

public extension UIImageView{
    static func createImageView(image : UIImage?,
                                contentMode : UIView.ContentMode = .scaleAspectFit) -> UIImageView{
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = contentMode
        return imageView
    }
    
    static func createImageView(imageName : String,
                                contentMode : UIView.ContentMode = .scaleAspectFit) -> UIImageView{
        return createImageView(image: UIImage(named: imageName), contentMode: contentMode)
    }
}
