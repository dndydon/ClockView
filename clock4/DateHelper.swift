//
//  DateHelper.swift
//  clock4
//
//  Created by Don Sleeter on 1/8/18.
//  Copyright © 2018 Don Sleeter. All rights reserved.
//

import Foundation

public extension Date {
  
  /**
   *  Convenient accessor of the date's `Calendar` components.
   *
   *  - parameter component: The calendar component to access from the date
   *
   *  - returns: The value of the component
   *
   */
  func component(_ component: Calendar.Component) -> Int {
    let calendar = Calendar.autoupdatingCurrent
    return calendar.component(component, from: self)
  }
  
  /**
   *  Convenience getter for the date's `hour` component
   */
  var hour: Int {
    return component(.hour)
  }
  
  /**
   *  Convenience getter for the date's `minute` component
   */
  var minute: Int {
    return component(.minute)
  }
  
  /**
   *  Convenience getter for the date's `second` component
   */
  var second: Int {
    return component(.second)
  }
  
}
