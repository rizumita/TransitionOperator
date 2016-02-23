//
//  TransitionOperator.swift
//  TransitionOperator
//
//  Created by Ryoichi Izumita on 2016/02/23.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation

public protocol TransitionOperatorType: class {
    
    func operate(executor executor: Any, source: UIViewController, destination: UIViewController)
    
}

public class TransitionOperator<Executor: Any, Source: UIViewController, Destination: UIViewController>: TransitionOperatorType {
    
    public typealias Operation = (Executor, Source, Destination) -> ()
    
    let operation: Operation
    
    public init(operation: Operation) {
        self.operation = operation
    }
    
    public func operate(executor executor: Any, source: UIViewController, destination: UIViewController) {
        operation(executor as! Executor, source as! Source, destination as! Destination)
    }
    
}
