//
//  UIStackViewBuilder.swift
//  Dicee-iOS13
//
//  Created by Adan on 20/05/21.
//

import Foundation
import UIKit

public extension UIStackView{
    static func createStackView(axis : NSLayoutConstraint.Axis,
                         spacing : CGFloat = 0,
                         aligment : UIStackView.Alignment,
                         distribution : UIStackView.Distribution = .fill) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = aligment
        stackView.distribution = distribution
        return stackView
    }
    
    func addArrangedSubviews(views : UIView...){
        views.forEach{
            self.addArrangedSubview($0)
        }
    }
    
    func applyPadding(top: CGFloat = 0, left : CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0){
        self.layoutMargins = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        self.isLayoutMarginsRelativeArrangement = true
    }
}


