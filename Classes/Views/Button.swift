import UIKit

open class Button: UIButton, DeclarativeProtocol, DeclarativeProtocolInternal {
    public var declarativeView: Button { self }
    public lazy var properties = Properties<Button>()
    lazy var _properties = PropertiesInternal()
    
    @UIKitPlus.State public var height: CGFloat = 0
    @UIKitPlus.State public var width: CGFloat = 0
    @UIKitPlus.State public var top: CGFloat = 0
    @UIKitPlus.State public var leading: CGFloat = 0
    @UIKitPlus.State public var left: CGFloat = 0
    @UIKitPlus.State public var trailing: CGFloat = 0
    @UIKitPlus.State public var right: CGFloat = 0
    @UIKitPlus.State public var bottom: CGFloat = 0
    @UIKitPlus.State public var centerX: CGFloat = 0
    @UIKitPlus.State public var centerY: CGFloat = 0
    
    var __height: UIKitPlus.State<CGFloat> { $height }
    var __width: UIKitPlus.State<CGFloat> { $width }
    var __top: UIKitPlus.State<CGFloat> { $top }
    var __leading: UIKitPlus.State<CGFloat> { $leading }
    var __left: UIKitPlus.State<CGFloat> { $left }
    var __trailing: UIKitPlus.State<CGFloat> { $trailing }
    var __right: UIKitPlus.State<CGFloat> { $right }
    var __bottom: UIKitPlus.State<CGFloat> { $bottom }
    var __centerX: UIKitPlus.State<CGFloat> { $centerX }
    var __centerY: UIKitPlus.State<CGFloat> { $centerY }
    
    public init (_ title: String = "") {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubviews()
    }
    
    open override func didMoveToSuperview() {
        super.didMoveToSuperview()
        movedToSuperview()
    }
    
    open override var isHighlighted: Bool {
        didSet {
            if originalBackground == nil {
                originalBackground = backgroundColor
            }
            if isHighlighted {
                backgroundColor = backgroundHighlighted ?? backgroundColor
            } else {
                backgroundColor = originalBackground ?? backgroundColor
            }
        }
    }
    
    // MARK: Background Highlighted
    
    var originalBackground: UIColor?
    var backgroundHighlighted: UIColor?
    
    @discardableResult
    public func backgroundHighlighted(_ color: UIColor, _ state: UIControl.State = .normal) -> Self {
        backgroundHighlighted = color
        return self
    }
    
    @discardableResult
    public func backgroundHighlighted(_ number: Int, _ state: UIControl.State = .normal) -> Self {
        backgroundHighlighted(number.color)
    }
    
    // MARK: Title
    
    @discardableResult
    public func title(_ title: String, _ state: UIControl.State = .normal) -> Self {
        setTitle(title, for: state)
        return self
    }
    
    // MARK: Title Color
    
    @discardableResult
    public func color(_ color: UIColor, _ state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    public func color(_ number: Int, _ state: UIControl.State = .normal) -> Self {
        color(number.color, state)
    }
    
    // MARK: Title Font
    
    @discardableResult
    public func font(v: UIFont?) -> Self {
        titleLabel?.font = v
        return self
    }
    
    @discardableResult
    public func font(_ identifier: FontIdentifier, _ size: CGFloat) -> Self {
        font(v: UIFont(name: identifier.fontName, size: size))
    }
    
    // MARK: Image
    
    @discardableResult
    public func image(_ image: UIImage?, _ state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func image(_ imageName: String, _ state: UIControl.State = .normal) -> Self {
        image(UIImage(named: imageName), state)
    }
    
    @discardableResult
    public func mode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }
    
    // MARK: Insets
    
    @discardableResult
    public func titleInsets(_ insets: UIEdgeInsets) -> Self {
        titleEdgeInsets = insets
        return self
    }
    
    @discardableResult
    public func titleInsets(top: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) -> Self {
        titleInsets(.init(top: top, left: left, bottom: bottom, right: right))
    }
    
    @discardableResult
    public func imageInsets(_ insets: UIEdgeInsets) -> Self {
        imageEdgeInsets = insets
        return self
    }
    
    @discardableResult
    public func imageInsets(top: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) -> Self {
        imageInsets(.init(top: top, left: left, bottom: bottom, right: right))
    }
}