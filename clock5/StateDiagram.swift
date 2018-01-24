//
//  StateDiagram.swift
//  clock5
//
//  Created by Don Sleeter on 1/11/18.
//  Copyright © 2018 Don Sleeter. All rights reserved.
//  

import UIKit

@IBDesignable
class StateDiagram: UIView {
  
  /// The color value - default is UIColor(red: 0.173, green: 0.494, blue: 0.141, alpha: 1.000)
  //@IBInspectable var cColor: UIColor = UIColor(red: 0.173, green: 0.494, blue: 0.141, alpha: 1.000) { didSet { setNeedsDisplay() } }
  @IBInspectable var agreeColor: UIColor = UIColor(red: 0.173, green: 0.494, blue: 0.141, alpha: 1.000) { didSet { setNeedsDisplay() } }
  @IBInspectable var disagreeColor: UIColor = UIColor(red: 0.775, green: 0.000, blue: 0.000, alpha: 1.000) { didSet { setNeedsDisplay() } }
  
  /// The Model:  Creating a StateDiagram with many properties by setting this public property
  public var colorToDisplay: UIColor? {
    willSet {
      configureDiagram(color: newValue!)
    }
  }
  
  override var description: String {
    return "StateDiagram"
  }
 
  func configureDiagram(color: UIColor) {
    //self.cColor = color
    setNeedsDisplay()
  }
  
  override func draw(_ rect: CGRect) {
    /// StyleKits require CGFloats for all numbers such as hours, minutes, and seconds
    print(rect)
    
    /// this is the default constructor signature
    StyleKit_ConsensusGraph.drawArgument(frame: rect,
                                         resizing: .aspectFit,
                                         agreeColor: self.agreeColor,
                                         blockColor: UIColor(red: 1.000, green: 0.642, blue: 0.099, alpha: 1.000),
                                         disagreeColor: self.disagreeColor,
                                         resultsColor: UIColor(red: 0.738, green: 0.839, blue: 1.000, alpha: 1.000),
                                         negResult: "Block",
                                         standAsideText: "Let It Go",
                                         scaleFactor: CGFloat(1))
    
  }
  
  // MARK: - UIGestureRecognizerDelegate methods
  
  /// TODO: - Make the StateDiagram clickable. Animatable. And Drillable. Segue to Detail View that allows fields of an Argument model to be filled out.
  /// The date and elapsed time will be helpful to capture and display on each new addition to the argument.
  
}
