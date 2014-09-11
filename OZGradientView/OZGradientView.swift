//
//  OZGradientView.swift
//  CustomUI
//
//  Created by Kiattisak Anoochitarom on 9/11/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable class OZGradientView: UIView {
    
    // MARK: - Inspectable properties
    
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {
        didSet {
            setupView()
        }
    }

    @IBInspectable var isHorizontal: Bool = false {
        didSet {
            setupView()
        }
    }

    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet {
            setupView()
        }
    }
    
    // MARK: - Main Layer
    
    var gradientLayer: CAGradientLayer {
        return layer as CAGradientLayer
    }
    
    // MARK: - Internal Function
    
    private func setupView() {
        let colors: Array<AnyObject> = [startColor.CGColor, endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        if (isHorizontal) {
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
    }
    
    // MARK: - Overrided Functions
    
    override class func layerClass() -> AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}
