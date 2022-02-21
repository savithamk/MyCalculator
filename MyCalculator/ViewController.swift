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
    
    //This function reads the percentage operator and computes the percentage of a number
    @IBAction func percentage(_ sender: Any) {
        operationType = "%"
        calculatedResult = formatResult(value: evaluatePercentage())
        displayedNumber.text = calculatedResult
        secondNumberAfterResult = ""
        
    }
    
    //This function reads the square root operator and computes the square root of a number
    @IBAction func squareRoot(_ sender: Any) {
        operationType = "√"
        calculatedResult = formatResult(value: evaluateSquareRoot())
        displayedNumber.text = calculatedResult
        secondNumberAfterResult = ""
    }
    
    //This function reads the sine operator and computes the sine of a number
    @IBAction func sine(_ sender: Any) {
        operationType = "sin"
        calculatedResult = formatResult(value: evaluateSine())
        displayedNumber.text = calculatedResult
        secondNumberAfterResult = ""
        
    }
    
    //This function reads the tangent operator and computes the tangent of a number
    @IBAction func tangent(_ sender: Any) {
        operationType = "tan"
        calculatedResult = formatResult(value: evaluateTangent())
        displayedNumber.text = calculatedResult
        secondNumberAfterResult = ""
    }
    
    //This function provides result by evaluating corresponding operation
    @IBAction func equals(_ sender: Any) {
        if (firstNumber != "" || calculatedResult != "") && (secondNumber != "" || secondNumberAfterResult != ""){
            calculatedResult = formatResult(value: evaluateExpression())
            displayedNumber.text = calculatedResult
            secondNumberAfterResult = ""
        }
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
    
    //This function calculates percentage
    func evaluatePercentage() -> Double {
            if !hasResult {
                hasResult = true
                return (Double(firstNumber)!) / 100
            }
            else {
                if secondNumberAfterResult != "" {
                    return Double(secondNumberAfterResult)! / 100
                } else {
                    return Double(calculatedResult)! / 100
                }
            }
    }
    
    //This function calculates square root of a number
    func evaluateSquareRoot() -> Double {
            if !hasResult {
                hasResult = true
                return sqrt(Double(firstNumber)!)
            }
            else {
                if secondNumberAfterResult != "" {
                    return sqrt(Double(secondNumberAfterResult)!)
                } else {
                    return sqrt(Double(calculatedResult)!)
                }
            }
    }
    
    //This function calculates sine of a number
    func evaluateSine() -> Double {
            if !hasResult {
                hasResult = true
                return getTrigonometricResult(function: sin, value: Double(firstNumber)!)
            }
            else {
                if secondNumberAfterResult != "" {
                    return getTrigonometricResult(function: sin, value: Double(secondNumberAfterResult)!)
                }else{
                    return getTrigonometricResult(function: sin, value: Double(calculatedResult)!)
                }
            }
    }
    
    //This function performs tangent of a number
    func evaluateTangent() -> Double {
            if !hasResult {
                hasResult = true
                return getTrigonometricResult(function: tan, value: Double(firstNumber)!)
            }
        else {
            if secondNumberAfterResult != "" {
                return getTrigonometricResult(function: tan, value: Double(secondNumberAfterResult)!)
            }else{
                return getTrigonometricResult(function: tan, value: Double(calculatedResult)!)
            }
        }
    }
    
    //Function to get trigonometric operation result
    func getTrigonometricResult(function: (Double) -> Double, value: Double) -> Double {
        return function(value * Double.pi / 180)
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

