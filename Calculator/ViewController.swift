//
//  ViewController.swift
//  Calculator
//
//  Created by Shukhrat Kirgizbaev on 10/26/17.
//  Copyright © 2017 Shukhrat Kirgizbaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // inferred type
    var userIsInTheMiddleOfTyping = false
    
    // implicitly unwrapped optional
    @IBOutlet weak var display: UILabel!
    
    @IBAction func tuchDigit(_ sender: UIButton) {
        //let digit = sender.currentTitle
        //print("\(digit ?? "no value") was called")
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
    // computed property
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    // private model property
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        // perform the operation
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        // update the display if I can
        if let result = brain.result {
            displayValue = result
        }
        
    }
    
}

