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
  
  @IBOutlet weak var stateDiagram: StateDiagram!
  @IBOutlet weak var clockView: ClockView!
  @IBOutlet weak var dataPicker: UIDatePicker?
  @IBOutlet weak var UpdateBtn: UIBarButtonItem!
  @IBOutlet weak var dateTimeLabel: UILabel!
  
  // the Model
  var timeToDisplay: Date? {
    willSet {
      guard let newDate = newValue else { return }
      updateView(newDate: newDate)
    }
  }
  
  /// Load the current time (if model not set), IBInspectables ignored
  override func viewDidLoad() {
    super.viewDidLoad()
    
    stateDiagram = StateDiagram()
    
    guard let _ = timeToDisplay else {
      timeToDisplay = updateNow()
      return
    }
  }
  
  func updateView(newDate: Date) {
    title = "Discussion Clock"
    clockView?.timeToDisplay = newDate
    dateTimeLabel.text = newDate.asDateTimeString()
  }
  
  @IBAction func updateAction(_ sender: Any) {
    timeToDisplay = updateNow()
  }
  
  func updateNow() -> Date {
    return Date()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    stateDiagram = nil
    clockView = nil
  }
  
}
