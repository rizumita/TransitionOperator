//
//  WireframeType.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/25.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import UIKit
import TransitionOperator

protocol WireframeType: _WireframeType {
 
    var viewController: UIViewController? { get set }
    
    func showDestination(withText text: String)

}

protocol _WireframeType: class {
    
    func prepare(forSegue segue: UIStoryboardSegue, sender: AnyObject?)
}

extension _WireframeType {
    
    func prepare(forSegue segue: UIStoryboardSegue, sender: AnyObject?) {
        switch (segue, sender) {
        case (let s as TransitionExecutorSegue, let .Some(op as TransitionOperatorType)):
            s.transitionOperator = op
        case (let s as TransitionExecutorSegue, let .Some(payload as TransitionPayloadType)):
            s.transitionPayload = payload
        default: ()
        }
    }
    
}
