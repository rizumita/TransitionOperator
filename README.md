# TransitionOperator
Transition operator class operates transition from one view controller to other view controller. Mainly the class is used with UIStoryboardSegue.

## Usage

The project has real usage as a sample app that inject a transition operator to segue by DI container library named 'Swinject'. If you want to know power of this library, please read that sample project and sample project's unit tests codes.

```Swift
protocol NumberPossessioner: class {
    var number: Int? { get set }
}

class SourceViewController: UIViewController {
    let number = 10
}

class DestinationViewController: UIViewController, NumberPossessioner {
    var number: Int?
}


TransitionExecutorSegue.transitionOperator = TransitionOperator { (segue: TransitionExecutorSegue, source: UIViewController, destination: UIViewController) in
    // Injecting dependencies by Swinject
    //    segue.transitionOperator = assembler.resolver.resolve("MySegue")
}


let segue = TransitionExecutorSegue(identifier: "playground", source: SourceViewController(), destination: DestinationViewController()) {}

segue.transitionOperator = TransitionOperator { (segue: TransitionExecutorSegue, source: SourceViewController, destination: NumberPossessioner) in
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
