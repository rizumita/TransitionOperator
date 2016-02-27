//
// Created by 和泉田 領一 on 2016/02/25.
// Copyright (c) 2016 CAPH TECH. All rights reserved.
//

import Foundation

public protocol TransitionExecutorType {

    var transitionOperator: TransitionOperatorType? { get set }

    var transitionPayload: TransitionPayloadType? { get set }

}
