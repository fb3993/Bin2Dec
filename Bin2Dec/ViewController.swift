//
//  ViewController.swift
//  Bin2Dec
//
//  Created by Filippo Bertolina on 27/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var binaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        decimalLabel.text = String(0)
        binaryLabel.text = String(0)
    }
    
    //MARK: - UI Buttons Methods
    @IBAction func decimalNumberButtonPressed(_ sender: UIButton) {
        let number = Int(sender.currentTitle!)
        updateDecimalLabel(digit: number!)
        if let decimalNumber = Int(decimalLabel.text!) {
            let binaryString = convertToBinary(number: decimalNumber)
            binaryLabel.text = binaryString
        }
    }
    
    @IBAction func binaryNumberButtonPressed(_ sender: UIButton) {
        let number = Int(sender.currentTitle!)
        updateBinaryLabel(digit: number!)
        if let binaryNumber = Int(binaryLabel.text!) {
            let decimalString = convertToDecimal(number: binaryNumber)
            decimalLabel.text = decimalString
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        decimalLabel.text = String(0)
        binaryLabel.text = String(0)
    }
    
    @IBAction func copyBinaryButtonPressed(_ sender: UIButton) {
        UIPasteboard.general.string = binaryLabel.text
    }
    @IBAction func copyDecimalButtonPressed(_ sender: UIButton) {
        UIPasteboard.general.string = decimalLabel.text
    }
    
    
    //MARK: - Label Methods
    func updateDecimalLabel(digit: Int) {
        if decimalLabel.text == "0" {
            decimalLabel.text = String(digit)
        } else {
            decimalLabel.text?.append(String(digit))
        }
    }
    
    func updateBinaryLabel(digit: Int) {
        if binaryLabel.text == "0" {
            binaryLabel.text = String(digit)
        } else {
            binaryLabel.text?.append(String(digit))
        }
    }
    
    //MARK: - Conversion Methods
    
    func convertToBinary(number: Int) -> String {
        
        var binaryString = String()
        
        func calculateQuotient(number: Int) {
            let quotient = number / 2
            let remainder = number - (quotient * 2)
            binaryString.append(String(remainder))
            if quotient >= 1 {
                calculateQuotient(number: quotient)
            }
        }
        
        calculateQuotient(number: number)
        
        return binaryString
        
    }
    
    func power(base x: Int, exponent y: Int) -> Int {
        if x == 0 {
            if y != 0 {
                return 0
            } else {
                return 0
            }
        }
        if y == 0 {
            return 1
        }
        var number = 1
        for _ in 1...y {
            number *= x
        }
        return number
    }
    
    func convertToDecimal(number: Int) -> String {
        var decimalString = String()
        var binaryNumber = number
        var decimalNumber = 0
        var i = 0
        while binaryNumber > 0 {
            var tempNumber = binaryNumber
            binaryNumber /= 10
            tempNumber -= binaryNumber * 10
            decimalNumber += tempNumber * power(base: 2, exponent: i)
            i += 1
        }
        decimalString = String(decimalNumber)
        return decimalString
    }
    
}

