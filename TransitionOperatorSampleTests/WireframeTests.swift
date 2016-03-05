//
//  WireframeTests.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/25.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import XCTest
@testable import TransitionOperatorSample
import Swinject
import TransitionOperator

class WireframeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShowDestination() {
        var result: String?

        let expectation = expectationWithDescription("testShowDestination")
        
        let container = Container()
        container.register(TransitionOperatorType.self, name: "ActionDestinationSegue") {
            r in
            return TransitionOperator {
                (segue: TransitionExecutorSegue, s: UIViewController, d: UIViewController) in
                result = segue.transitionPayload?.payloadValue as? String
                XCTAssertEqual(result!, "test_text")
                XCTAssertTrue(d is DestinationViewController)
                expectation.fulfill()
            }
        }
        
        TransitionExecutorSegue.transitionOperator = TransitionOperator {
            (segue: TransitionExecutorSegue, source: Any, destination: Any) in
            if let op = container.resolve(TransitionOperatorType.self, name: segue.identifier) {
                segue.transitionOperator = op
            }
        }

        let wireframe = Wireframe()
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? UINavigationController
        let controller = navigationController?.viewControllers.first
        wireframe.viewController = controller
        
        wireframe.showDestination(withText: "test_text")
        
        waitForExpectationsWithTimeout(2.0) { (error: NSError?) -> Void in }
    }

}
