//
//  UIStackViewBuilder.swift
//  Dicee-iOS13
//
//  Created by Adan on 20/05/21.
//

import Foundation
import UIKit

public extension UIStackView{
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

public class UIStackViewBuilder{
    let stackView = UIStackView()
    
    init(axis : NSLayoutConstraint.Axis){
        stackView.axis = axis
    }
    
    func withSpacing(_ spacing : CGFloat) -> Self{
        stackView.spacing = spacing
        return self
    }
    
    func withAligment(_ aligment : UIStackView.Alignment) -> Self{
        stackView.alignment = aligment
        return self
    }
    
    func withDistribution(_ distribution : UIStackView.Distribution) -> Self{
        stackView.distribution = distribution
        return self
    }
    
    
    func build() -> UIStackView{
        return stackView
    }
}
