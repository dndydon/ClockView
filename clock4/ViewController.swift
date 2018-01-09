//
//  ViewController.swift
//  clock4
//
//  Created by Don Sleeter on 8/2/17.
//  Copyright © 2017 Don Sleeter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  /// PaintCode used for drawing a custom clock
  @IBOutlet weak var clockView: ClockView!
  @IBOutlet weak var UpdateBtn: UIBarButtonItem!
  
  // This will load the clock's default time
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "PaintCode Clock"
  }
  
  @IBAction func updateAction(_ sender: Any) {
    _ = updateNow()
  }
  
  func updateNow() -> Date {
    let now = Date()
    clockView?.timeToDisplay = now
    return now
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
