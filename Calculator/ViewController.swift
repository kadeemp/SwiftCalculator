//
//  ViewController.swift
//  Calculator
//
//  Created by Kadeem Palacios on 12/14/16.
//  Copyright © 2016 Kadeem Palacios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberDisplay.text = "0"
    }
    //MARK:- Variables
    let defaults = UserDefaults.standard
    var caseCounter = 0
    var digit:String? = nil
    var digit2:String? = nil

    var userIsInTheMiddleOfTypingANumber = false
    
    //MARK:- Functions
    func multiply(value1:Int, value2:Int) -> Int {
        let result = value1*value2
        displayResult(result: String(result))
        return result
    }
    func add(value1:Int, value2:Int) -> Int {
        let result = value1+value2
        displayResult(result: String(result))
        return result
    }
    func divide(value1:Int, value2:Int) -> Int {
        let result = value1/value2
        displayResult(result: String(result))
        return result
    }
    func subtract(value1:Int, value2:Int) -> Int {
        let result = value1-value2
        displayResult(result: String(result))
        return result
    }
    func save() {
        defaults.set(digit, forKey: "digit1")
        if digit2 != nil {
            self.defaults.set(digit2, forKey: "digit2")

        }
        
    }
    func clear() {
        numberDisplay.text = ""

    }
    func clearAll() {
        clear()
         digit = nil
         digit2 = ""
        save()
    }
    
    func displayResult(result:String) {
        self.numberDisplay.text! = String(result)
    }
    func fetch() {
        digit = defaults.string(forKey: "digit1")
        digit2 = defaults.string(forKey: "digit2")
    }
    
    func swap() {
        if digit2 != nil{
        digit = digit2
        digit2 = nil
        }
    }
    //MARK:- IB Outlets
    
    @IBOutlet weak var numberDisplay: UILabel!
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    //MARK:- IB Actions
    
    @IBAction func numberTapped(_ sender: UIButton) {
        if digit == nil {
            
            digit = sender.currentTitle!
            save()
            if userIsInTheMiddleOfTypingANumber == true {
                numberDisplay.text! += digit!
            }
            else {
            numberDisplay.text! = digit!
            }
        }
        else {
            digit2 = sender.currentTitle!
            save()
            if userIsInTheMiddleOfTypingANumber  == true{
                numberDisplay.text! += digit2!
            }
            else {
                numberDisplay.text! = digit2!
            }
        }
    }
    @IBAction func ACbutton(_ sender: UIButton) {
        clearAll()
    }
    @IBAction func Divide(_ sender: UIButton) {
        swap()
        save()
        clear()
        caseCounter = 1
    }
    @IBAction func Multiply(_ sender: UIButton) {
        swap()
        save()
        clear()
        caseCounter = 2
    }
    @IBAction func Subtract(_ sender: UIButton) {
        swap()
        save()
        clear()
        caseCounter = 3
    }
    @IBAction func Add(_ sender: UIButton) {
        swap()
        save()
        clear()
        caseCounter = 4
    }
    @IBAction func Equals(_ sender: UIButton) {
        fetch()
        
        print("Equals button pressed")
        switch caseCounter{
        case 1: divide(value1: Int(digit!)!, value2: Int(digit2!)!); print("divide function exectuted");
        case 2: multiply(value1: Int(digit!)!, value2: Int(digit2!)!);print("multiply function exectuted");
        case 3: subtract(value1: Int(digit!)!, value2: Int(digit2!)!);print("subtract function exectuted");
        case 4: add(value1: Int(digit!)!, value2: Int(digit2!)!);print("add function exectuted");
        default : print ("default case executed")
        }
        
        
        
        
    }
}

