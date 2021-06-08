import Foundation
import UIKit

//https://www.avanderlee.com/swift/auto-layout-programmatically/
@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}

public extension UIView{
    
    func constraintsToSameWidth(view: UIView,
                                multiplier: CGFloat = 1) -> [NSLayoutConstraint]{
        return [widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)]
    }
    
    func constraintsToSameHeight(view: UIView,
                                 multiplier: CGFloat = 1) -> [NSLayoutConstraint]{
        return [heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)]
    }
    
    func constraintsToSameSize(view: UIView,
                               widthMultiplier: CGFloat = 1,
                               heightMultiplier: CGFloat = 1) -> [NSLayoutConstraint]{
        return [widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: heightMultiplier)]
    }
    
    func constraintsForCenterIn(view: UIView) -> [NSLayoutConstraint]{
        return [
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }
    
    func constraintsForAnchoringTo(view : UIView,
                                   top : CGFloat = 0,
                                   leading : CGFloat = 0,
                                   bottom : CGFloat = 0,
                                   trailing : CGFloat = 0) -> [NSLayoutConstraint] {
        
        return [
            topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1*bottom),
            trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -1*trailing),
        ]
    }
    
    func constraintsForAnchoringTo(view : UIView,
                                   padding : CGFloat) -> [NSLayoutConstraint] {
        
        return constraintsForAnchoringTo(view: view,
                                         top: padding,
                                         leading: padding,
                                         bottom: padding,
                                         trailing: padding)
    }
    
    func constraintsForAnchoringToSafeArea(view: UIView,
                                   top : CGFloat = 0,
                                   leading : CGFloat = 0,
                                   bottom : CGFloat = 0,
                                   trailing : CGFloat = 0) -> [NSLayoutConstraint]{
        return [
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: top),
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leading),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1*bottom),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -1*trailing),
        ]
    }
    
    func constraintsForAnchoringToSafeArea(view: UIView,
                                           padding : CGFloat) -> [NSLayoutConstraint]{
        return constraintsForAnchoringToSafeArea(view: view,
                                                 top: padding,
                                                 leading: padding,
                                                 bottom: padding,
                                                 trailing: padding)
    }
    
    func constraintsForSize(width : CGFloat, height: CGFloat) -> [NSLayoutConstraint]{
        return [
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ]
    }
    
    

}

public extension NSLayoutConstraint{
    func activate(){
        //https://www.innoq.com/en/blog/ios-auto-layout-problem/
        if let view = self.firstItem as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        self.isActive = true
    }
    
    func setLessPriorityThan(otherConstraint : NSLayoutConstraint){
        self.priority = UILayoutPriority(max(otherConstraint.priority.rawValue - 10.0,0))
    }
}

public extension Array where Element == NSLayoutConstraint{
    func activate(){
        self.forEach{constraint in constraint.activate()}
    }
}
