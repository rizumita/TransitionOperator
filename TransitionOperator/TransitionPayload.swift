//
// Created by 和泉田 領一 on 2016/02/25.
// Copyright (c) 2016 CAPH TECH. All rights reserved.
//

import Foundation

public protocol TransitionPayloadType: class {

    var payloadValue: Any? { get }

}

public class TransitionPayload: TransitionPayloadType {

    public var payloadValue: Any?

    public init(value: Any?) {
        payloadValue = value
    }

}
