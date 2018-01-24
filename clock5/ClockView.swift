//
//  ClockView.swift
//  clock5
//
//  Created by Don Sleeter on 8/2/17.
//  Copyright © 2017 Don Sleeter. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
  
  /// The hour hand value - default is 0
  @IBInspectable var hours: CGFloat = 0 { didSet { setNeedsDisplay() } }
  
  /// The minute hand value - default is 0
  @IBInspectable var minutes: CGFloat = 0 { didSet { setNeedsDisplay() } }
  
  /// The second hand value - default is 0
  @IBInspectable var seconds: CGFloat = 0 { didSet { setNeedsDisplay() } }
  
  override var description: String {
    return "ClockView (h:\(hours), m:\(minutes), s:\(seconds))"
  }
  
  /// Creating a ClockView is usually done with a Date by setting this public property
  /// If a real Date shows up... configure the view with Ints
  public var timeToDisplay: Date? {
    willSet {
      guard let newDate = newValue else { return }
      configureClock(hours: (newDate.hour),
                     minutes: (newDate.minute),
                     seconds: (newDate.second))
    }
  }
  
  func configureClock(hours: Int, minutes: Int, seconds: Int) {
    self.hours = CGFloat(hours)
    self.minutes = CGFloat(minutes)
    self.seconds = CGFloat(seconds)
    setNeedsDisplay()
  }
  
  override func draw(_ rect: CGRect) {
    /// StyleKits require CGFloats for all numbers such as hours, minutes, and seconds
    StyleKit_Clock.drawClock(frame: rect,
                             hours: hours, minutes: minutes, seconds: seconds,
                             scale: CGFloat(0.92))
  }
  
}
