//
//  File.swift
//  
//
//  Created by Adan on 08/06/21.
//

import Foundation
import UIKit

public protocol ThenExtensionProtocol{}

extension UIView : ThenExtensionProtocol{}

public extension ThenExtensionProtocol where Self : UIView{
    func then(_ postConstructorFunction: (Self) -> Void) -> Self{
        postConstructorFunction(self)
        return self
    }
}
