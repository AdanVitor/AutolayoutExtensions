//
//  File.swift
//  
//
//  Created by Adan on 08/06/21.
//

import Foundation
import UIKit

protocol ThenExtensionProtocol{}

extension UIView : ThenExtensionProtocol{}

extension ThenExtensionProtocol where Self : UIView{
    func then(_ thenFunction: (Self) -> Void){
        thenFunction(self)
    }
}
