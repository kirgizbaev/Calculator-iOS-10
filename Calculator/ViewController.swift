//
//  ViewController.swift
//  Calculator
//
//  Created by Shukhrat Kirgizbaev on 10/26/17.
//  Copyright © 2017 Shukhrat Kirgizbaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false

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
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            //userIsInTheMiddleOfTyping = true
            case "√":
                let operand = Double(display.text!)!
                displayValue = sqrt(operand)
            default:
                break
            }
        }
        
    }
    
}

