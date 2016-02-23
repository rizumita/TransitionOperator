# TransitionOperator
Transition operator class operates transition from one view controller to other view controller. Mainly the class is used with UIStoryboardSegue.

## Usage

```Swift
class SourceViewController: UIViewController {
    let number = 10
}

class DestinationViewController: UIViewController {
    var number: Int?
}


UIStoryboardSegue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, _, _) in
    // Injecting dependencies by Swinject
    //    segue.transitionOperator = assembler.resolver.resolve(segue.identifier!)
}


let segue = UIStoryboardSegue(identifier: "playground", source: SourceViewController(), destination: DestinationViewController()) {}

segue.transitionOperator = TransitionOperator { (segue: UIStoryboardSegue, source: SourceViewController, destination: DestinationViewController) in
    destination.number = source.number
    print(destination.number)
}
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
