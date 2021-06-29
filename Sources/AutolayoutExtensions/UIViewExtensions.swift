//
//  File.swift
//  
//
//  Created by Adan on 08/06/21.
//

import Foundation
import UIKit

public extension UIView{
    func setupBackgroundImage(image : UIImage?, contentMode : ContentMode = .scaleAspectFill){
        let imageView = UIImageView.createImageView(image: image, contentMode: contentMode)
        self.addSubview(imageView)
        imageView.constraintsForAnchoringTo(view: self).activate()
    }
}

public extension UIView {
    func enableHideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
