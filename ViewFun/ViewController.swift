//
//  ViewController.swift
//  ViewFun
//
//  Created by James Campagno on 8/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueView = UIView(frame: CGRect(x: 20.0, y: 20.0, width: 100.0, height: 100.0))
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        
        let redView = UIView(frame: CGRect(x: 150.0, y: 150.0, width: 40.0, height: 40.0))
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
    }
    
}
