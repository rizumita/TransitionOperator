//
//  Assembler.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/25.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import Foundation
import Swinject
import TransitionOperator

let assembler = try! Assembler(assemblies: [Assembly()])

class Assembly: AssemblyType {
    
    func assemble(container: Container) {
        container.register(WireframeType.self) { r in
            return Wireframe()
        }.inObjectScope(.Container)
        
        container.register(TransitionOperatorType.self, name: "DestinationSegue") {
            r in
            return storyboardReferenceDestinationTransitionOperator
        }

        container.register(TransitionOperatorType.self, name: "ActionDestinationSegue") {
            r in
            return actionDestinationTransitionOperator
        }

        TransitionExecutorSegue.transitionOperator = TransitionOperator {
            (segue: TransitionExecutorSegue, source: Any, destination: Any) in
            if let op = assembler.resolver.resolve(TransitionOperatorType.self, name: segue.identifier) {
                segue.transitionOperator = op
            }
        }
    }
    
}

extension SwinjectStoryboard {
    
    class func setup() {
        defaultContainer.registerForStoryboard(ViewController.self) {
            r, c in
            let wireframe = assembler.resolver.resolve(WireframeType.self)
            wireframe?.viewController = c
            c.wireframe = wireframe
        }
    }
    
}
