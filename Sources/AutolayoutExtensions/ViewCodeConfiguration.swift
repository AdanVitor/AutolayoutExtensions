//
//  Created by Adan on 20/05/21.
//

import Foundation
//https://pedroalvarez-29395.medium.com/view-code-em-ios-a-control-framework-to-eliminate-interface-builders-449fa1884958
public protocol ViewCodeConfiguration{
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

public extension ViewCodeConfiguration{
    
    func configureViews() {}
    
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}

