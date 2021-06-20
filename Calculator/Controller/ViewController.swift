//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text ?? "") else { return 0.0}
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculationMethod = CalculationMethod()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculationMethod.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
 
            if let result = calculationMethod.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numberValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numberValue
                isFinishedTypingNumber = false
            } else {
                
                if numberValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt { return }
                }
                
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
        
    }
    
}

