//
//  ClockView.swift
//  clock4
//
//  Created by Don Sleeter on 8/2/17.
//  Copyright © 2017 Don Sleeter. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
  
  @IBInspectable
  public var hours: CGFloat = 12
  
  @IBInspectable
  public var minutes: CGFloat = 33
  
  @IBInspectable
  public var seconds: CGFloat = 40
  
  @IBInspectable
  private var myClock: StyleKit_Clock {
    return StyleKit_Clock()
  }
  
  convenience init(hours: CGFloat, minutes: CGFloat, seconds: CGFloat) {
    self.init()
    self.hours = hours; self.minutes = minutes; self.seconds = seconds
  }
  
  override var description: String {
    return "(h:\(hours), m:\(minutes), s:\(seconds))"
  }
  
  var timeToDisplay: Date? {
    didSet {
      hours = CGFloat((self.timeToDisplay?.hour)!)
      minutes = CGFloat((self.timeToDisplay?.minute)!)
      seconds = CGFloat((self.timeToDisplay?.second)!)
      configureClock(time: self.timeToDisplay!)
      
    }
  }
  
  func configureClock(time: Date) {
    if timeToDisplay == nil {
      print("no time to display?", self.description)
    }
    print(self.description)
    setNeedsDisplay()
  }
  
  override func draw(_ rect: CGRect) {
    StyleKit_Clock.drawClock(frame: rect, resizing: .center,
                             hours: hours, minutes: minutes, seconds: seconds)
  }
  
}
