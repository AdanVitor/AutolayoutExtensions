//
//  File.swift
//  
//
//  Created by Adan on 31/05/21.
//

import Foundation
import UIKit

public extension UIProgressView{
    
    static func create(then : ((UIProgressView) -> Void)? = nil) -> UIProgressView{
        let progressView = UIProgressView()
        then?(progressView)
        return progressView
        
    }
}
