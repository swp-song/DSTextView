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
    private var character: NSCharacterSet?
    
    private lazy var placeholderView : UILabel = {
        let label : UILabel = UILabel()
        label.text      = "Placeholder"
        label.font      = UIFont.systemFont(ofSize: kPlaceholderDefaultFontSize)
        label.textColor = .lightGray
        return label;
    }()
    
    open override var delegate: UITextViewDelegate? {
//        self = delegate
//        set { self }
//        super.delegate = self
        set {  super.delegate = self }
        get { super.delegate }
//        return super.delegate
    }
    

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
        print("Class = \(type(of: self)), \(#function)")
        #else
        #endif
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidBeginEditingNotification, object: self)
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: self)
    }
}



private extension DSTextView {
    
    dynamic func config() -> Void {
        
        self.character = NSCharacterSet(charactersIn: "0123456789")
        
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
        NotificationCenter.default.addObserver(self, selector: #selector(textDidBegin(_:)), name: UITextView.textDidBeginEditingNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextView.textDidChangeNotification, object: self)
    }
    
    @objc private func textDidBegin(_ notification : Notification) -> Void {
        
    }
    
    
    @objc private func textDidChange(_ notification : Notification) -> Void {
//        guard let textView = notification.object as? DSTextView else { return }
        
        self.text = ""
        
        self.placeholderHidden(self.text, animate: self.kHiddenAnimationTime)
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

extension DSTextView: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        
    }
    
}
