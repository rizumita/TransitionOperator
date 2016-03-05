//
//  TransitionExecutorSegue.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/03/04.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import UIKit

public class TransitionExecutorSegue: UIStoryboardSegue, TransitionExecutorType {

    public static var transitionOperator: TransitionOperatorType?
    
    public var transitionOperator: TransitionOperatorType?
    
    public var transitionPayload: TransitionPayloadType?
    
    public override func perform() {
        self.dynamicType.transitionOperator?.operate(executor: self, source: sourceViewController, destination: destinationViewController)
        transitionOperator?.operate(executor: self, source: sourceViewController, destination: destinationViewController)
        super.perform()
    }

}
