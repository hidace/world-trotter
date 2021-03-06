//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Dace Willmott on 12/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet var celsiusLabel: UILabel!
  @IBOutlet var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view")
  }
  
  var farenheightValue: Double? {
    didSet {
      updateCelsiusLabel()
    }
  }
  
  
  var celsiusValue: Double? {
    if let value = farenheightValue {
      return (value - 32) * (5/9)
    } else {
      return nil
    }
  }
  
  func updateCelsiusLabel() {
    if let value = celsiusValue {
      celsiusLabel.text = numberFormatter.stringFromNumber(value)
    } else {
      celsiusLabel.text = "???"
    }
  }
  
  @IBAction func fahrenheightFieldEditingChanged(textField: UITextField) {
    if let text = textField.text, value = Double(text) {
      farenheightValue = value
    } else {
      farenheightValue = nil
    }
  }
  
  @IBAction func dismissKeyboard(sender: AnyObject) {
    textField.resignFirstResponder()
  }
  
  let numberFormatter: NSNumberFormatter = {
    let nf = NSNumberFormatter()
    nf.numberStyle = .DecimalStyle
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()
  
  func textField(textField: UITextField,
                  shouldChangeCharactersInRange range: NSRange,
                  replacementString string: String) -> Bool {
    let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
    let replacementTextHasDecimalSeparator = string.rangeOfString(".")
    
    if existingTextHasDecimalSeparator != nil &&
      replacementTextHasDecimalSeparator != nil {
      return false
    } else {
      return true
    }
  }
  
}

