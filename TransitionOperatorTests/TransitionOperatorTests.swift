//
//  TransitionOperatorTests.swift
//  TransitionOperatorTests
//
//  Created by 和泉田 領一 on 2016/02/23.
//  Copyright © 2016年 CAPH. All rights reserved.
//

import XCTest
import UIKit
@testable import TransitionOperator

class TransitionOperatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class TestExecutor: TransitionExecutorType {
        var transitionOperator: TransitionOperatorType?
        var transitionPayload: TransitionPayloadType?
    }
    
    func testOperate() {
        let op = TransitionOperator { (executor: TestExecutor, source: SourceViewController, destination: DestinationViewController) -> () in
            XCTAssertTrue(executor.dynamicType == TestExecutor.self)
            destination.number = source.number
        }

        let destination = DestinationViewController(nibName: nil, bundle: nil)
        op.operate(executor: TestExecutor(), source: SourceViewController(nibName: nil, bundle: nil), destination: destination)
        XCTAssertEqual(destination.number!, 10)
    }
    
    func testUnsuitableType() {
        class UnsuitableViewController: UIViewController {}
        
        let op = TransitionOperator { (executor: TestExecutor, source: SourceViewController, destination: DestinationViewController) -> () in
            XCTFail()
        }
        
        let destination = UnsuitableViewController()
        op.operate(executor: TestExecutor(), source: SourceViewController(nibName: nil, bundle: nil), destination: destination)
    }
    
}

class SourceViewController: UIViewController {
    let number = 10
}

class DestinationViewController: UIViewController {
    var number: Int?
}
