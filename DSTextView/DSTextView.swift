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

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
}


public extension DS where DSBase: DSTextView {
    
    var text: String { self.ds.text }
}



extension DS where DSBase: DSTextView {
    
}



extension DSTextView: DSCompatible { }
