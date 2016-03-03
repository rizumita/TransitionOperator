# TransitionOperator
Transition operator class operates transition from one view controller to other view controller. Mainly the class is used with UIStoryboardSegue.

## Usage

The project has real usage as a sample app that inject a transition operator to segue by DI container library named 'Swinject'. If you want to know power of this library, please read that sample project and sample project's unit tests codes.

```Swift
class SourceViewController: UIViewController {
    let number = 10
}

class DestinationViewController: UIViewController {
    var number: Int?
}


UIStoryboardSegue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, _, _) in
    // Injecting dependencies by Swinject
    //    segue.transitionOperator = assembler.resolver.resolve(TransitionOperatorType.self, name: segue.identifier)
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
```

## Install by Carthage

Add the following line to your Cartfile
```Cartfile
github "rizumita/TransitionOperator"
```

and run `carthage update`


## License

MIT License
