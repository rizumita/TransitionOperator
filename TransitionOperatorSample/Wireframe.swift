//
//  Wireframe.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/25.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import UIKit
import TransitionOperator

class Wireframe: WireframeType {
    
    var viewController: UIViewController?
    
    func showDestination(withText text: String) {
        viewController?.performSegueWithIdentifier("ActionDestinationSegue", sender: TransitionPayload(value: text))
    }

}