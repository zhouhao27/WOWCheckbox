//
//  WOWCheckbox.swift
//  Checkbox
//
//  Created by Zhou Hao on 11/8/15.
//  Copyright (c) 2015 WOWtv. All rights reserved.
//
//

import UIKit

public protocol WOWCheckboxDelegate {
    func didSelectCheckbox(_ checkbox : WOWCheckbox)
}

@IBDesignable
open class WOWCheckbox : UIControl {

    // MARK: inspectable properties
    @IBInspectable
    open var isChecked : Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    open var lineWidth : CGFloat = 2 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    open var borderColor : UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    open var boxBackgroundColor : UIColor = UIColor.clear {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    open var tickColor : UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }

    // TODO: doesn't work for protocol, if it's possible in the future?
    @IBInspectable
    open var delegate: WOWCheckboxDelegate? = nil {
        didSet {
            
        }
    }
    
    // MARK: view life circle
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame);
        
        setup()
    }
    
    // MARK: local functions
    func setup() {
        
        self.addTarget(self, action: #selector(WOWCheckbox.onTouchUpInside(_:)), for: UIControlEvents.touchUpInside);
    }
    
    func onTouchUpInside(_ sender: UIButton) {
        isChecked = !isChecked
        delegate?.didSelectCheckbox(self)
    }
    
    // MARK: drawing
    open override func draw(_ frame: CGRect) {
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: frame.minX + 10, y: frame.minY + 10, width: frame.width - 20, height: frame.height - 20), cornerRadius: 3)
        boxBackgroundColor.setFill()
        rectanglePath.fill()
        borderColor.setStroke()
        rectanglePath.lineWidth = lineWidth
        rectanglePath.stroke()

        if isChecked {
            
            let frame2 = CGRect(x: frame.minX + floor(frame.width * 0.34091 + 0.5), y: frame.minY + floor(frame.height * 0.34091 + 0.5), width: floor(frame.width * 0.65909 + 0.5) - floor(frame.width * 0.34091 + 0.5), height: floor(frame.height * 0.65909 + 0.5) - floor(frame.height * 0.34091 + 0.5))
            
            let tickPath = UIBezierPath()
            tickPath.move(to: CGPoint(x: frame2.minX + 0.03571 * frame2.width, y: frame2.minY + 0.47468 * frame2.height))
            tickPath.addCurve(to: CGPoint(x: frame2.minX + 0.42262 * frame2.width, y: frame2.minY + 0.96429 * frame2.height), controlPoint1: CGPoint(x: frame2.minX + 0.34205 * frame2.width, y: frame2.minY + 0.91364 * frame2.height), controlPoint2: CGPoint(x: frame2.minX + 0.42262 * frame2.width, y: frame2.minY + 0.96429 * frame2.height))
            tickPath.addLine(to: CGPoint(x: frame2.minX + 0.96429 * frame2.width, y: frame2.minY + 0.03571 * frame2.height))
            tickPath.lineCapStyle = .round
            tickPath.lineJoinStyle = .round
            
            tickColor.setStroke()
            tickPath.lineWidth = lineWidth
            tickPath.stroke()
            
        }
    }
    
}
