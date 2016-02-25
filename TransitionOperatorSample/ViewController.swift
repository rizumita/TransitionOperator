//
//  ViewController.swift
//  TransitionOperatorSample
//
//  Created by 和泉田 領一 on 2016/02/25.
//  Copyright © 2016年 CAPH TECH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var wireframe: WireframeType!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func action(sender: AnyObject) {
        wireframe.showDestination(withText: "IBAction")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        wireframe.prepare(forSegue: segue, sender: sender)
    }

}
