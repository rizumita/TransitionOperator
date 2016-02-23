//
//  TransitionOperator.swift
//  TransitionOperator
//
//  Created by Ryoichi Izumita on 2016/02/23.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation

protocol TransitionOperatorType: class {
    
    func operate(source source: UIViewController, destination: UIViewController)
    
}

class TransitionOperator<Source: UIViewController, Destination: UIViewController>: TransitionOperatorType {
    
    typealias Operation = (Source, Destination) -> ()
    
    let operation: Operation
    
    init(operation: Operation) {
        self.operation = operation
    }
    
    func operate(source source: UIViewController, destination: UIViewController) {
        operation(source as! Source, destination as! Destination)
    }
    
}
