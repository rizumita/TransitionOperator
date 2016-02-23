//
//  TransitionOperator.swift
//  TransitionOperator
//
//  Created by Ryoichi Izumita on 2016/02/23.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation

protocol TransitionOperatorType: class {
    
    func operate(executor executor: Any, source: UIViewController, destination: UIViewController)
    
}

class TransitionOperator<Executor: Any, Source: UIViewController, Destination: UIViewController>: TransitionOperatorType {
    
    typealias Operation = (Executor, Source, Destination) -> ()
    
    let operation: Operation
    
    init(operation: Operation) {
        self.operation = operation
    }
    
    func operate(executor executor: Any, source: UIViewController, destination: UIViewController) {
        operation(executor as! Executor, source as! Source, destination as! Destination)
    }
    
}
