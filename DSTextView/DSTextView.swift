//
//  DSTextView.swift
//  DSTextView
//
//  Created by Dream on 2020/12/17.
//

import UIKit

import DSBase

open class DSTextView: UITextView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    // MARK: - Private Property
    private let kHiddenAnimationTime : TimeInterval   = 0.5
    private let kPlaceholderDefaultFontSize : CGFloat = 15.0
    
    private lazy var placeholderView : UILabel = {
        let label : UILabel = UILabel()
        label.text      = "Placeholder"
        label.font      = UIFont.systemFont(ofSize: kPlaceholderDefaultFontSize)
        label.textColor = .lightGray
        return label;
    }()
    

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        config()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setUIFrame()
    }
    
    
    deinit {
        #if DEBUG
        print("Class = \(Self.Type.self), \(#function)")
        #else
        #endif
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: self)
    }
}



private extension DSTextView {
    
    func config() -> Void {
        self.setUpUI()
        self.propertyConfig()
    }
    
    func setUpUI() -> Void {
        self.addSubview(self.placeholderView)
    }
    
    func setUIFrame() -> Void {
        let placeholderX : CGFloat = 8.0
        self.placeholderView.frame = CGRect(x: placeholderX, y: 3.0, width: self.frame.size.width - placeholderX * 2.0, height: 25.0)
    }
    
    func propertyConfig() -> Void {
        self.font = UIFont.systemFont(ofSize: kPlaceholderDefaultFontSize)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextView.textDidChangeNotification, object: self)
    }
    
    
    @objc private func textDidChange(_ notification : Notification) -> Void {
        guard let textView = notification.object as? DSTextView else { return }
        self.text = textView.text
        #if DEBUG
        guard let text = self.text else { return }
        print(text)
        #else
            
        #endif
        
        self.placeholderHidden(text, animate: self.kHiddenAnimationTime)
    }
    
    private func placeholderHidden(_ string : String, animate: TimeInterval) -> Void {
        if self.text.count == 0 {
            if string == "" {
                self.isPlaceholderHidden(false, animate: animate)
            } else {
                self.isPlaceholderHidden(true, animate: animate)
            }
        } else {
            
            if self.text.count == 1 {
                if self.text == "" {
                    self.isPlaceholderHidden(false, animate: animate)
                } else {
                    self.isPlaceholderHidden(true, animate: animate)
                }
            } else {
                self.isPlaceholderHidden(true, animate: animate)
            }
        }
    }
    
    private func isPlaceholderHidden(_ isHidden : Bool, animate: TimeInterval) {
        UIView.animate(withDuration: animate) { //[weak self] in
            self.placeholderView.alpha = isHidden ? 0 : 1
        };
    }
    
}


public extension DS where DSBase: DSTextView {
    
    var text: String? {
        set { self.ds.text = newValue }
        get { self.ds.text }
    }
    
    var layer: CALayer { self.ds.layer }
}



extension DS where DSBase: DSTextView {
    
}



extension DSTextView: DSCompatible { }
