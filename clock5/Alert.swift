//
//  Alert.swift
//  clock5
//
//  Created by Don Sleeter on 1/7/18.
//  Copyright © 2018 Don Sleeter. All rights reserved.
//

import Foundation
import UIKit

class Alert {
  
  /// Show a basic alert
  class func showBasic(title: String, message: String, vc: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    vc.present(alert, animated: true)
  }
  
  /// Show a text entry alert with two custom buttons.
  func showTextEntryAlert(title: String, message: String, vc: UIViewController) {
    let title = NSLocalizedString("A Short Title is Best", comment: "")
    let message = NSLocalizedString("A message should be a short, complete sentence.", comment: "")
    let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
    let otherButtonTitle = NSLocalizedString("OK", comment: "")
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    // Add the text field for text entry.
    alertController.addTextField { textField in
      // If you need to customize the text field, you can do so here.
    }
    
    // Create the actions.
    let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
      NSLog("The \"Text Entry\" alert's cancel action occured.")
    }
    
    let otherAction = UIAlertAction(title: otherButtonTitle, style: .default) { _ in
      NSLog("The \"Text Entry\" alert's other action occured.")
    }
    
    // Add the actions.
    alertController.addAction(cancelAction)
    alertController.addAction(otherAction)
    
    vc.present(alertController, animated: true, completion: nil)
  }
  
}



