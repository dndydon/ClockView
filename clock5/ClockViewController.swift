//
//  ViewController.swift
//  clock5
//
//  Created by Don Sleeter on 8/2/17.
//  Copyright © 2017 Don Sleeter. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
  
  /// PaintCode used for drawing a custom clock
  
  @IBOutlet weak var clockView: ClockView!
  @IBOutlet weak var dateTimeLabel: UILabel!
  @IBOutlet weak var stateDiagram: StateDiagram!
  @IBOutlet var tapGetureRecognizer: UITapGestureRecognizer!
  
  private var timer: Timer!
  
  // the Model
  public var timeToDisplay: Date? {
    willSet {
      guard let newDate = newValue else { return }
      updateView(newDate: newDate)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    stateDiagram = StateDiagram()
    
    self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAction), userInfo: nil, repeats: true)
    
    // if timeToDisplay is nil, set it and return
    // otherwise it was set by a different controller
    guard let _ = timeToDisplay else {
      timeToDisplay = updateNow()
      return
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    timer.invalidate()
  }
  
  func updateView(newDate: Date) {
    title = "Discussion Clock"
    clockView?.timeToDisplay = newDate
    dateTimeLabel?.text = newDate.asDateTimeString()
  }
  
  @objc
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
    timer.invalidate()
    timer = nil
  }
  
}
