//
//  WOWCheckbox.swift
//  Checkbox
//
//  Created by Zhou Hao on 11/8/15.
//  Copyright (c) 2015 WOWtv. All rights reserved.
//
//

import UIKit

protocol WOWCheckboxDelegate {
    func didSelectCheckbox(checkbox : WOWCheckbox)
}

@IBDesignable
public class WOWCheckbox : UIControl {

    // MARK: inspectable properties
    @IBInspectable
    public var isChecked : Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var lineWidth : CGFloat = 2 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var boxBackgroundColor : UIColor = UIColor.clearColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var tickColor : UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }

    // TODO: doesn't work for protocol, if it's possible in the future?
    @IBInspectable
    var delegate: WOWCheckboxDelegate? = nil {
        didSet {
            
        }
    }
    
    // MARK: view life circle
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setup()
    }
    
    // MARK: local functions
    func setup() {
        
        self.addTarget(self, action: "onTouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside);
    }
    
    func onTouchUpInside(sender: UIButton) {
        isChecked = !isChecked
        delegate?.didSelectCheckbox(self)
    }
    
    // MARK: drawing
    public override func drawRect(frame: CGRect) {
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRectMake(frame.minX + 10, frame.minY + 10, frame.width - 20, frame.height - 20), cornerRadius: 3)
        boxBackgroundColor.setFill()
        rectanglePath.fill()
        borderColor.setStroke()
        rectanglePath.lineWidth = lineWidth
        rectanglePath.stroke()

        if isChecked {
            
            let frame2 = CGRectMake(frame.minX + floor(frame.width * 0.34091 + 0.5), frame.minY + floor(frame.height * 0.34091 + 0.5), floor(frame.width * 0.65909 + 0.5) - floor(frame.width * 0.34091 + 0.5), floor(frame.height * 0.65909 + 0.5) - floor(frame.height * 0.34091 + 0.5))
            
            let tickPath = UIBezierPath()
            tickPath.moveToPoint(CGPointMake(frame2.minX + 0.03571 * frame2.width, frame2.minY + 0.47468 * frame2.height))
            tickPath.addCurveToPoint(CGPointMake(frame2.minX + 0.42262 * frame2.width, frame2.minY + 0.96429 * frame2.height), controlPoint1: CGPointMake(frame2.minX + 0.34205 * frame2.width, frame2.minY + 0.91364 * frame2.height), controlPoint2: CGPointMake(frame2.minX + 0.42262 * frame2.width, frame2.minY + 0.96429 * frame2.height))
            tickPath.addLineToPoint(CGPointMake(frame2.minX + 0.96429 * frame2.width, frame2.minY + 0.03571 * frame2.height))
            tickPath.lineCapStyle = .Round
            tickPath.lineJoinStyle = .Round
            
            tickColor.setStroke()
            tickPath.lineWidth = lineWidth
            tickPath.stroke()
            
        }
    }
    
}
