//
//  UIStoryboardSegue+ExtensionsTests.swift
//  TransitionOperator
//
//  Created by 和泉田 領一 on 2016/02/23.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import XCTest
import UIKit
@testable import TransitionOperator

class UIStoryboardSegue_ExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        UIStoryboardSegue.transitionOperator = nil
        super.tearDown()
    }
    
    func testStaticTransitionOperator() {
        let expectation = expectationWithDescription("testStaticTransitionOperator")

        UIStoryboardSegue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, source: UIViewController, destination: UIViewController) in
            XCTAssertEqual(segue.identifier!, "test")
            expectation.fulfill()
        }
        let source = UIViewController(nibName: nil, bundle: nil)
        let destination = UIViewController(nibName: nil, bundle: nil)
        let segue = UIStoryboardSegue(identifier: "test", source: source, destination: destination) {
            source.presentViewController(destination, animated: false, completion: nil)
        }
        segue.perform()

        waitForExpectationsWithTimeout(2.0) { _ in }
    }

    func testStaticTransitionOperatorWithSubclass() {
        class SubSegue: UIStoryboardSegue {}

        let expectation = expectationWithDescription("testStaticTransitionOperator")

        SubSegue.transitionOperator = TransitionOperator { (segue: SubSegue, source: UIViewController, destination: UIViewController) in
            XCTAssertTrue(segue.dynamicType == SubSegue.self)
            XCTAssertEqual(segue.identifier!, "test")
            expectation.fulfill()
        }
        let source = UIViewController(nibName: nil, bundle: nil)
        let destination = UIViewController(nibName: nil, bundle: nil)
        let segue = SubSegue(identifier: "test", source: source, destination: destination) {
            source.presentViewController(destination, animated: false, completion: nil)
        }
        segue.perform()

        waitForExpectationsWithTimeout(2.0) { _ in }
    }

    func testStaticTransitionOperatorWithParentAndSubclass() {
        class SubSegue: UIStoryboardSegue {}

        let expectation = expectationWithDescription("testStaticTransitionOperator")

        UIStoryboardSegue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, source: UIViewController, destination: UIViewController) in
            XCTFail()
        }

        let source = UIViewController(nibName: nil, bundle: nil)
        let destination = UIViewController(nibName: nil, bundle: nil)
        let segue = SubSegue(identifier: "test", source: source, destination: destination) {
            source.presentViewController(destination, animated: false, completion: nil)
            expectation.fulfill()
        }
        segue.perform()

        waitForExpectationsWithTimeout(2.0) { _ in }
    }

    func testStaticTransitionOperatorWithSubclassAndParent() {
        class SubSegue: UIStoryboardSegue {}

        let expectation = expectationWithDescription("testStaticTransitionOperator")

        SubSegue.transitionOperator = TransitionOperator { (segue: SubSegue, source: UIViewController, destination: UIViewController) in
            XCTFail()
        }

        let source = UIViewController(nibName: nil, bundle: nil)
        let destination = UIViewController(nibName: nil, bundle: nil)
        let segue = UIStoryboardSegue(identifier: "test", source: source, destination: destination) {
            source.presentViewController(destination, animated: false, completion: nil)
            expectation.fulfill()
        }
        segue.perform()

        waitForExpectationsWithTimeout(2.0) { _ in }
    }

    func testTransitionOperator() {
        let expectation = expectationWithDescription("testStaticTransitionOperator")

        let source = SourceViewController()
        let destination = DestinationViewController()
        let segue = UIStoryboardSegue(identifier: "test", source: source, destination: destination) {
            source.presentViewController(destination, animated: false, completion: nil)
        }
        segue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, s: SourceViewController, d: DestinationViewController) in
            destination.number = source.number
            expectation.fulfill()
        }
        segue.perform()

        waitForExpectationsWithTimeout(2.0) { _ in }
    }

    func testTransitionOperatorWithSubclass() {
        class SubSegue: UIStoryboardSegue {}

        let expectation = expectationWithDescription("testStaticTransitionOperator")

        let source = UIViewController(nibName: nil, bundle: nil)
        let destination = UIViewController(nibName: nil, bundle: nil)
        let segue = SubSegue(identifier: "test", source: source, destination: destination) {
            source.presentViewController(destination, animated: false, completion: nil)
        }
        segue.transitionOperator = TransitionOperator { (segue: SubSegue, source: UIViewController, destination: UIViewController) in
            expectation.fulfill()
        }
        segue.perform()

        waitForExpectationsWithTimeout(2.0) { _ in }
    }

    func testTransitionPayload() {
        let expectation = expectationWithDescription("testTransitionPayload")

        let segue = UIStoryboardSegue(identifier: "test", source: UIViewController(nibName: nil, bundle: nil), destination: UIViewController(nibName: nil, bundle: nil)) {}
        segue.transitionOperator = TransitionOperator { (s: UIStoryboardSegue, source: UIViewController, destination: UIViewController) in
            let value = s.transitionPayload?.payloadValue as! Int
            XCTAssertEqual(value, 1)
            expectation.fulfill()
        }
        segue.transitionPayload = TransitionPayload(value: 1)
        segue.perform()

        waitForExpectationsWithTimeout(2.0) { _ in }
    }

}
