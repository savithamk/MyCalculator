//
//  ViewController.swift
//  MyCalculator
//
//  Created by Savitha M K on 2022-02-19.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: String = ""
    var secondNumber: String = ""
    var operationType: String = ""
    var hasResult: Bool = false
    var calculatedResult: String = ""
    var secondNumberAfterResult: String = ""
    
    
    @IBOutlet weak var displayedNumber: UILabel!
    
    //This function reads the screen input numbers
    @IBAction func numPressed(_ sender: UIButton) {
        if operationType == "" {
            firstNumber += String(sender.tag)
            displayedNumber.text = firstNumber
        }
        else if operationType != "" && !hasResult{
            secondNumber += String(sender.tag)
            displayedNumber.text = secondNumber
        }
        else if operationType != "" && hasResult{
            secondNumberAfterResult += String(sender.tag)
            displayedNumber.text = secondNumberAfterResult
        }
    }
    
    //This function reads the addition operator
    @IBAction func addition(_ sender: Any) {
        operationType = "+"
    }
    
    //This function reads the subtraction operator
    @IBAction func subtraction(_ sender: Any) {
        operationType = "-"
    }
    
    //This function reads the multiplication operator
    @IBAction func multiplication(_ sender: Any) {
        operationType = "X"
    }
    
    //This function reads the division operator
    @IBAction func divider(_ sender: Any) {
        operationType = "/"
    }
    
    //This function provides result by evaluating corresponding operation
    @IBAction func equals(_ sender: Any) {
        calculatedResult = formatResult(value: evaluateExpression())
        displayedNumber.text = calculatedResult
        secondNumberAfterResult = ""
    }
    
    //This is the collection object of all the buttons
    @IBOutlet var calculatorButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting cornerRadius for all the buttons
        for button in calculatorButtons {
            button.layer.cornerRadius =  button.bounds.size.height / 3
        }
    }
    
    //This function is to clear all the data
    @IBAction func allClear(_ sender: Any) {
         firstNumber = ""
         secondNumber = ""
         operationType = ""
         hasResult = false
         calculatedResult = ""
         secondNumberAfterResult = ""
         displayedNumber.text = "0"
    }
    
    //This function evaluates the expression based on the operation type
    func evaluateExpression() -> Double {
        switch operationType {
        case "+" : return evaluateAddition()
        case "-" : return evaluateSubtraction()
        case "X" : return evaluateMultiplication()
        case "/" : return evaluateDivision()
        default : return 0;
        }
      
    }
    
    //This function performs addition
    func evaluateAddition() -> Double {
            if !hasResult {
                hasResult = true
                return Double(firstNumber)! + Double(secondNumber)!
            }
            else {
                return Double(calculatedResult)! + Double(secondNumberAfterResult)!
            }
    }
    
    //This function performs subtraction
    func evaluateSubtraction() -> Double {
             if !hasResult {
                 hasResult = true
                 return Double(firstNumber)! - Double(secondNumber)!
             }
             else {
                 return Double(calculatedResult)! - Double(secondNumberAfterResult)!
             }
    }
    
    //This function performs multiplication
    func evaluateMultiplication() -> Double {
            if !hasResult {
                hasResult = true
                return Double(firstNumber)! * Double(secondNumber)!
            }
            else {
                return Double(calculatedResult)! * Double(secondNumberAfterResult)!
            }
    }
    
    //This function performs division
    func evaluateDivision() -> Double {
            if !hasResult {
                hasResult = true
                return Double(firstNumber)! / Double(secondNumber)!
            }
            else {
                return Double(calculatedResult)! / Double(secondNumberAfterResult)!
            }
    }
    
    //This function formats the result to required decimal places
    func formatResult(value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", value)
        }else {
            return String(format: "%.9f", value)
        }
    }
    
}

