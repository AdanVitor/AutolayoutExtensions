//
//
//  Created by Adan on 27/05/21.
//

import Foundation
import UIKit

// https://www.avanderlee.com/swift/custom-combine-publisher/
/// Extending the `UIControl` types to be able to produce a `UIControl.Event` publisher.
public protocol CombineCompatible { }
public extension UIControl: CombineCompatible { }
public extension CombineCompatible where Self: UIControl {
    func actionPublisher(for events: UIControl.Event) -> UIControlPublisher {
        return UIControlPublisher(control: self, events: events)
    }
}
