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
    
    enum SideAnchor{
        case top
        case leading
        case bottom
        case trailing
    }
    
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
    
    private func buildConstraint<T>(anchor : NSLayoutAnchor<T>,
                                    containerAnchor : NSLayoutAnchor<T>,
                                    constant : CGFloat,
                                    isApplicable : Bool,
                                    isLowerPriority : Bool) -> NSLayoutConstraint?{
        let constraint = isApplicable ? anchor.constraint(equalTo: containerAnchor, constant: constant) : nil
        constraint?.setLowerPriorityIf(isLowerPriority)
        return constraint
    }
    
    func constraintsForAnchoringTo(view : UIView,
                                   top : CGFloat = 0,
                                   leading : CGFloat = 0,
                                   bottom : CGFloat = 0,
                                   trailing : CGFloat = 0,
                                   excludingSideAnchors : [SideAnchor] = [],
                                   withLowerPrioritySideAnchors lowerPrioritySideAnchors: [SideAnchor] = []) -> [NSLayoutConstraint] {
        
        let top = buildConstraint(anchor: topAnchor,
                                  containerAnchor: view.topAnchor,
                                  constant: top,
                                  isApplicable: !excludingSideAnchors.contains(.top),
                                  isLowerPriority: lowerPrioritySideAnchors.contains(.top))
        
        let leading = buildConstraint(anchor: leadingAnchor,
                                      containerAnchor: view.leadingAnchor,
                                      constant: leading,
                                      isApplicable: !excludingSideAnchors.contains(.leading),
                                      isLowerPriority: lowerPrioritySideAnchors.contains(.leading))
        
        let bottom = buildConstraint(anchor: bottomAnchor,
                                     containerAnchor: view.bottomAnchor,
                                     constant: -1*bottom,
                                     isApplicable: !excludingSideAnchors.contains(.bottom),
                                     isLowerPriority: lowerPrioritySideAnchors.contains(.bottom))
        
        let trailing = buildConstraint(anchor: trailingAnchor,
                                       containerAnchor: view.trailingAnchor,
                                       constant: -1*trailing,
                                       isApplicable: !excludingSideAnchors.contains(.trailing),
                                       isLowerPriority: lowerPrioritySideAnchors.contains(.trailing))
        
        return [top, leading, bottom, trailing].compactMap{$0}
    }
    
    func constraintsForAnchoringTo(view : UIView,
                                   padding : CGFloat = 0,
                                   excludingSideAnchors : [SideAnchor] = [],
                                   withLowerPrioritySideAnchors lowerPrioritySideAnchors: [SideAnchor] = []) -> [NSLayoutConstraint] {
        
        return constraintsForAnchoringTo(view: view,
                                         top: padding,
                                         leading: padding,
                                         bottom: padding,
                                         trailing: padding,
                                         excludingSideAnchors: excludingSideAnchors,
                                         withLowerPrioritySideAnchors: lowerPrioritySideAnchors)
    }
    
    func constraintsForAnchoringToSafeArea(view : UIView,
                                           top : CGFloat = 0,
                                           leading : CGFloat = 0,
                                           bottom : CGFloat = 0,
                                           trailing : CGFloat = 0,
                                           excludingSideAnchors : [SideAnchor] = [],
                                           withLowerPrioritySideAnchors lowerPrioritySideAnchors: [SideAnchor] = []) -> [NSLayoutConstraint] {
        
        let top = buildConstraint(anchor: topAnchor,
                                  containerAnchor: view.safeAreaLayoutGuide.topAnchor,
                                  constant: top,
                                  isApplicable: !excludingSideAnchors.contains(.top),
                                  isLowerPriority: lowerPrioritySideAnchors.contains(.top))
        
        let leading = buildConstraint(anchor: leadingAnchor,
                                      containerAnchor: view.safeAreaLayoutGuide.leadingAnchor,
                                      constant: leading,
                                      isApplicable: !excludingSideAnchors.contains(.leading),
                                      isLowerPriority: lowerPrioritySideAnchors.contains(.leading))
        
        let bottom = buildConstraint(anchor: bottomAnchor,
                                     containerAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                                     constant: -1*bottom,
                                     isApplicable: !excludingSideAnchors.contains(.bottom),
                                     isLowerPriority: lowerPrioritySideAnchors.contains(.bottom))
        
        let trailing = buildConstraint(anchor: trailingAnchor,
                                       containerAnchor: view.safeAreaLayoutGuide.trailingAnchor,
                                       constant: -1*trailing,
                                       isApplicable: !excludingSideAnchors.contains(.trailing),
                                       isLowerPriority: lowerPrioritySideAnchors.contains(.trailing))
        
        return [top, leading, bottom, trailing].compactMap{$0}
    }
    
    
    
    func constraintsForAnchoringToSafeArea(view: UIView,
                                           padding : CGFloat = 0,
                                           excludingSideAnchors : [SideAnchor] = [],
                                           withLowerPrioritySideAnchors lowerPrioritySideAnchors: [SideAnchor] = []) -> [NSLayoutConstraint]{
        return constraintsForAnchoringToSafeArea(view: view,
                                                 top : padding,
                                                 leading : padding,
                                                 bottom : padding,
                                                 trailing : padding,
                                                 excludingSideAnchors: excludingSideAnchors,
                                                 withLowerPrioritySideAnchors: lowerPrioritySideAnchors)
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
    
    func setLowerPriorityIf(_ condition : Bool){
        if condition {self.priority = .defaultLow}
    }
}

public extension Array where Element == NSLayoutConstraint{
    func activate(){
        self.forEach{constraint in constraint.activate()}
    }
}
