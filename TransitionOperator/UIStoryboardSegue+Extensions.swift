//
//  UIStoryboardSegue+Extensions.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/23.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation
import ObjectiveC

var AssociatedObjectHandle: UInt8 = 0

extension UIStoryboardSegue {

    /*
     * You need pass TransitionOperator<Source = UIViewController, Destination = UIViewController>
     */
    public static var transitionOperator: TransitionOperatorType? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as? TransitionOperatorType
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var transitionOperator: TransitionOperatorType? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as? TransitionOperatorType
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    dynamic func performSwizzled() {
        self.dynamicType.transitionOperator?.operate(executor: self, source: sourceViewController, destination: destinationViewController)
        transitionOperator?.operate(executor: self, source: sourceViewController, destination: destinationViewController)

        performSwizzled()
    }
    
    override public class func initialize() {
        super.initialize()
        
        struct Static {
            static var token: dispatch_once_t = 0;
        }
        
        dispatch_once(&Static.token) {
            swizzlePerform()
        }
    }
    
    private static func swizzlePerform() {
        let originalSelector = Selector("perform");
        let swizzledSelector = Selector("performSwizzled");
        swizzle(self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }
    
    private static func swizzle(cls: AnyClass!, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(cls, originalSelector);
        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
        
        let didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if didAddMethod {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }

}
