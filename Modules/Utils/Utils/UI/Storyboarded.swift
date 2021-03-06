import Foundation
import UIKit

public protocol Storyboarded {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    
    static func instantiate() -> Self
}

public extension Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
    
    static var storyboardBundle: Bundle {
        return .main
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        return (storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self)!
    }
}
