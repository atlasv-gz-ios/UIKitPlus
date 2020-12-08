#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol FirstResponderRefusable {
    @discardableResult
    func refuseFirstResponder() -> Self
    
    @discardableResult
    func refuseFirstResponder(_ value: Bool) -> Self
    
    @discardableResult
    func refuseFirstResponder(_ binding: UIKitPlus.State<Bool>) -> Self
    
    @discardableResult
    func refuseFirstResponder<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _FirstResponderRefusable: FirstResponderRefusable {
    var _refuseFirstResponderState: State<Bool> { get }
    
    func _setRefuseFirstResponder(_ v: Bool)
}

extension FirstResponderRefusable {
    @discardableResult
    public func refuseFirstResponder() -> Self {
        refuseFirstResponder(true)
    }
    
    @discardableResult
    public func refuseFirstResponder(_ binding: UIKitPlus.State<Bool>) -> Self {
        binding.listen { self.refuseFirstResponder($0) }
        return refuseFirstResponder(binding.wrappedValue)
    }
    
    @discardableResult
    public func refuseFirstResponder<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        refuseFirstResponder(expressable.unwrap())
    }
}

@available(iOS 13.0, macOS 10.15, *)
extension FirstResponderRefusable {
    @discardableResult
    public func refuseFirstResponder(_ value: Bool) -> Self {
        guard let s = self as? _FirstResponderRefusable else { return self }
        s._setRefuseFirstResponder(value)
        return self
    }
}

// for iOS lower than 13
extension _FirstResponderRefusable {
    @discardableResult
    public func refuseFirstResponder(_ value: Bool) -> Self {
        _setRefuseFirstResponder(value)
        return self
    }
}