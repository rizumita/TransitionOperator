//
//  Transitions.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/25.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation
import TransitionOperator

var storyboardReferenceDestinationTransitionOperator: TransitionOperatorType = TransitionOperator { (segue: TransitionExecutorSegue, source: Any, destination: DestinationViewController) in
    destination.text = "Storyboard Reference"
}

var actionDestinationTransitionOperator: TransitionOperatorType = TransitionOperator { (segue: TransitionExecutorSegue, source: Any, destination: DestinationViewController) in
    if let text = segue.transitionPayload?.payloadValue as? String {
        destination.text = text
    }
}
