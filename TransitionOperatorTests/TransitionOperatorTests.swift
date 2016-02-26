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
    
    func testOperate() {
        class TestSegue: UIStoryboardSegue {
        }

        let destination = DestinationViewController(nibName: nil, bundle: nil)
        let segue = TestSegue(identifier: "test", source: SourceViewController(nibName: nil, bundle: nil), destination: destination) {}
        segue.transitionOperator = TransitionOperator { (_, source: SourceViewController, destination: DestinationViewController) -> () in
            destination.number = source.number
        }
        segue.perform()
        XCTAssertEqual(destination.number!, 10)
    }
    
}

class SourceViewController: UIViewController {
    let number = 10
}

class DestinationViewController: UIViewController {
    var number: Int?
}
