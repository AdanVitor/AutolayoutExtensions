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
    func then(_ thenFunction: (Self) -> Void) -> Self{
        thenFunction(self)
        return self
    }
}
