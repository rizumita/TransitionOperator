//
//  TransitionOperator.swift
//  TransitionOperator
//
//  Created by Ryoichi Izumita on 2016/02/23.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation

public protocol TransitionOperatorType: class {
    
    func operate(executor executor: TransitionExecutorType, source: Any, destination: Any) -> Bool
    
}

public class TransitionOperator<Executor: TransitionExecutorType, Source, Destination>: TransitionOperatorType {
    
    public typealias Operation = (Executor, Source, Destination) throws -> ()
    
    let operation: Operation
    
    public init(_ operation: Operation) {
        self.operation = operation
    }
    
    public func operate(executor executor: TransitionExecutorType, source: Any, destination: Any) -> Bool {
        do {
            try operation(executor as! Executor, source as! Source, destination as! Destination)
            return true
        }
        catch {
            return false
        }
    }
    
}
