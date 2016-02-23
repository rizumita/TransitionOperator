# TransitionOperator
Transition operator class for iOS operates transition from one view controller to other view controller. Mainly the class is used with UIStoryboardSegue.

## Usage

```Swift
let op = TransitionOperator { (source: SourceViewController, destination: DestinationViewController) -> () in
    destination.number = source.number
}
op.operate(source: SourceViewController(nibName: nil, bundle: nil), destination: DestinationViewController(nibName: nil, bundle: nil))
```

```Swift
let segue = UIStoryboardSegue(identifier: "test", source: SourceViewController(), destination: DestinationViewController()) {
    source.presentViewController(destination, animated: false, completion: nil)
}
segue.transitionOperator = TransitionOperator { (s: SourceViewController, d: DestinationViewController) in
    destination.number = source.number
}
segue.perform()
```

```Swift
UIStoryboardSegue.transitionOperator = TransitionOperator { _, _ in
    // some operations
}
let source = UIViewController(nibName: nil, bundle: nil)
let destination = UIViewController(nibName: nil, bundle: nil)
let segue = UIStoryboardSegue(identifier: "test", source: SourceViewController(), destination: DestinationViewController()) {
    source.presentViewController(destination, animated: false, completion: nil)
}
segue.perform()
```

## Install by Carthage

Add the following line to your Cartfile
```Cartfile
github "rizumita/TransitionOperator"
```

and run `carthage update`
