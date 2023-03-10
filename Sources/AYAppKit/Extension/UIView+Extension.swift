//
//  UIView+Extension.swift
//  AYAppKit
//
//  Created by devxsby on 2023/03/10.
//  Copyright © 2023 devxsby. All rights reserved.
//

import UIKit

/*
 UIView Extension for configure constraints anchors programmatically and add subviews
 */

extension UIView {
    public func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    public func anchor(top: NSLayoutYAxisAnchor? = nil,
                       leading: NSLayoutXAxisAnchor? = nil,
                       trailing: NSLayoutXAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       paddingTop: CGFloat = 0,
                       paddingLeading: CGFloat = 0,
                       paddingTrailing: CGFloat = 0,
                       paddingBottom: CGFloat = 0,
                       width: CGFloat? = nil,
                       height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let leading = leading {
            leftAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        updateConstraintsIfNeeded()
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
        updateConstraintsIfNeeded()
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
        updateConstraintsIfNeeded()
    }
    
    func centerY(inView view: UIView, leadingAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeading: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let leading = leadingAnchor {
            anchor(leading: leading, paddingLeading: paddingLeading)
        }
        updateConstraintsIfNeeded()
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
        updateConstraintsIfNeeded()
    }
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        updateConstraintsIfNeeded()
    }
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        updateConstraintsIfNeeded()
    }
    
    func fillSafeArea() {
        anchor(top: superview?.safeAreaLayoutGuide.topAnchor,
               leading: superview?.safeAreaLayoutGuide.leadingAnchor,
               trailing: superview?.safeAreaLayoutGuide.trailingAnchor,
               bottom: superview?.safeAreaLayoutGuide.bottomAnchor
        )
        updateConstraintsIfNeeded()
    }
    
    func fillSuperView() {
        anchor(top: superview?.topAnchor,
               leading: superview?.leadingAnchor,
               trailing: superview?.trailingAnchor,
               bottom: superview?.bottomAnchor
        )
        updateConstraintsIfNeeded()
    }
}
