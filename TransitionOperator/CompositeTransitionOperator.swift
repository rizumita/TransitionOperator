//
//  CompositeTransitionOperator.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/28.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation

public class CompositeTransitionOperator: TransitionOperatorType, ArrayLiteralConvertible {
    
    public typealias Element = TransitionOperatorType
    
    public required init(arrayLiteral elements: Element...) {
        operators = elements
    }
    
    public var forced: Bool = false
    
    private var operators: [Element] = []
    
    init(operators: [Element], forced: Bool = false) {
        self.operators = operators
    }

    public func add(nextOperator nextOperator: Element) {
        operators.append(nextOperator)
    }
    
    public func operate(executor executor: TransitionExecutorType, source: Any, destination: Any) -> Bool {
        for op in operators {
            if op.operate(executor: executor, source: source, destination: destination) == false && !forced {
                return false
            }
        }
        return true
    }
    
}

infix operator += {}

public func +=(compositeOperator: CompositeTransitionOperator, nextOperator: TransitionOperatorType) {
    compositeOperator.add(nextOperator: nextOperator)
}
