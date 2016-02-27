//: Playground - noun: a place where people can play

import UIKit
import TransitionOperator

class SourceViewController: UIViewController {
    let number = 10
}

class DestinationViewController: UIViewController {
    var number: Int?
}


UIStoryboardSegue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, _, _) in
    // Injecting dependencies by Swinject
    //    segue.transitionOperator = assembler.resolver.resolve("MySegue")
}


let segue = UIStoryboardSegue(identifier: "playground", source: SourceViewController(), destination: DestinationViewController()) {}

segue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, source: SourceViewController, destination: DestinationViewController) in
    destination.number = source.number
    print(destination.number)
    print(segue.transitionPayload?.payloadValue)
}

let payload = TransitionPayload(value: 1)
segue.transitionPayload = payload

segue.perform()
