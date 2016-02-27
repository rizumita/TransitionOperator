//
//  CompositeTransitionOperatorTests.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/28.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import XCTest
@testable import TransitionOperator

class CompositeTransitionOperatorTests: XCTestCase {
    
    class TestExecutor: TransitionExecutorType {
        var transitionOperator: TransitionOperatorType?
        var transitionPayload: TransitionPayloadType?
    }

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testComposite() {
        var sum: Int = 0
        
        let cOperator = CompositeTransitionOperator(operators: [TransitionOperator { (e: TestExecutor, s: Any, d: Any) in
            sum = sum + 1
            XCTAssertEqual(sum, 1)
            }, TransitionOperator { (e: TestExecutor, s: Any, d: Any) in
                sum = sum + 2
                XCTAssertEqual(sum, 3)
            }, TransitionOperator { (e: TestExecutor, s: Any, d: Any) in
                sum = sum + 3
                XCTAssertEqual(sum, 6)
            }])
        cOperator.operate(executor: TestExecutor(), source: "test", destination: "test")
        
        XCTAssertEqual(sum, 6)
    }
    
    func testArrayLiteral() {
        var sum: Int = 0
        
        let cOperator: CompositeTransitionOperator = [TransitionOperator { (e: TestExecutor, s: Any, d: Any) in
            sum = sum + 1
            XCTAssertEqual(sum, 1)
            }, TransitionOperator { (e: TestExecutor, s: Any, d: Any) in
                sum = sum + 2
                XCTAssertEqual(sum, 3)
            }, TransitionOperator { (e: TestExecutor, s: Any, d: Any) in
                sum = sum + 3
                XCTAssertEqual(sum, 6)
            }]
        cOperator.operate(executor: TestExecutor(), source: "test", destination: "test")
        
        XCTAssertEqual(sum, 6)
    }
    
}
