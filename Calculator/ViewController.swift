//
//  ViewController.swift
//  Calculator
//
//  Created by Justin Cheung on 22/10/2015.
//  Copyright © 2015 Justin Cheung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var typeInMiddle = false
    
    var brain = CalculatorBrain()
    
    @IBAction func digitInput(sender: UIButton) {
        let digit = sender.currentTitle!
        if(typeInMiddle==false){
            display.text = digit
            typeInMiddle=true
        }
        else{
            display.text = display.text! + digit
            
        }
        
    }

    @IBAction func operate(sender: UIButton) {
        if typeInMiddle{
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            }
            else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter() {
        typeInMiddle = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }
        else{
            displayValue = 0
        }
    }
    

    
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text! = "\(newValue)"
            typeInMiddle = false
        }
    }


}

