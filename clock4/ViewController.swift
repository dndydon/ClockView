//
//  ViewController.swift
//  clock4
//
//  Created by Don Sleeter on 8/2/17.
//  Copyright © 2017 Don Sleeter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var clockView: ClockView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "PaintCode Clock"
    clockView?.timeToDisplay = Date()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

