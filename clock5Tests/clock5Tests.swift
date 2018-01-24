//
//  clock5Tests.swift
//  clock5Tests
//
//  Created by Don Sleeter on 8/2/17.
//  Copyright © 2017 Don Sleeter. All rights reserved.
//

import XCTest
@testable import clock5

class clock5Tests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testViewController() {
    let vc = ViewController()
    let now = vc.updateNow()
    XCTAssertNotNil(now)
  }
  
  func testClockView() {
    let cv = ClockView()
    print(cv.description)
    cv.timeToDisplay = Date()
    print(cv.description)
    cv.configureClock(hours: 3, minutes: 4, seconds: 5)
    print(cv.description)
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
