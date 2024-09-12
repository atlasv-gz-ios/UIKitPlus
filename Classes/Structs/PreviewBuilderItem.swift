#if os(macOS)
import AppKit
#else
import UIKit
#endif

#if canImport(SwiftUI) && DEBUG
@available(iOS 13.0, macOS 10.15, *)
public protocol PreviewBuilderItem {
    var previewBuilderItems: [UPreview] { get }
}

@available(iOS 13.0, macOS 10.15, *)
public struct PreviewBuilderItems: PreviewBuilderItem {
    public let items: [UPreview]
    
    public init (items: [UPreview]) {
        self.items = items
    }
    
    public var previewBuilderItems: [UPreview] { items }
}

@available(iOS 13.0, macOS 10.15, *)
extension UPreview: PreviewBuilderItem {
    public var previewBuilderItems: [UPreview] { [self] }
}
#endif
