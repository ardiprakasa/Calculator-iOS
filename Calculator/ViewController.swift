//
//  ViewController.swift
//  Calculator
//
//  Created by Hardian Prakasa on 5/9/16.
//  Copyright © 2016 Ice House Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddelOfTypingANumber = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddelOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddelOfTypingANumber = true
        }
        
    }
    
    @IBAction func enter() {
        userIsInTheMiddelOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddelOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
        
    }
    

    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
    
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddelOfTypingANumber = false
        }
    }
        
}

