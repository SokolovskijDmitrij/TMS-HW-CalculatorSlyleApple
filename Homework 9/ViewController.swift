//
//  ViewController.swift
//  Homework 9
//
//  Created by Дмитрий Соколовский on 27.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var buttonNumbers: [UIButton]!
    
    @IBOutlet weak var resultLabel: UITextField!
    
    // MARK: Override properties
    
    var result: Double = 0
    var firstNumber: Double = 0
    var operation = 0
    var operationSing = false
    
    // MARK: Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons.forEach {button in
            button.layoutIfNeeded()
            button.layer.cornerRadius = button.frame.height / 2
        }
        buttonNumbers.forEach {buttonNumber in
            buttonNumber.layoutIfNeeded()
            buttonNumber.layer.cornerRadius = buttonNumber.frame.height / 2
        }
     }
    
    // MARK: IBAction
    
    @IBAction func numbers (_ sender: UIButton) {
        guard let text = resultLabel.text,
              text != "ERROR" else {return}
        if operationSing {
            resultLabel.text = String(sender.tag)
            operationSing = false
        } else if sender.restorationIdentifier == "comma" && !text.contains(".") {
            resultLabel.text = text + String(".")
        } else if resultLabel.text == "0" {
            resultLabel.text = String(sender.tag)
        } else if !(sender.restorationIdentifier == "comma") {
            resultLabel.text = text + String(sender.tag)
        }
        result = Double(resultLabel.text!) ?? 0
    }
    @IBAction func buttons (_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 18 {
            firstNumber = Double(resultLabel.text!)!
            operation = sender.tag
            operationSing = true
        }
        if sender.tag == 18 {
            switch operation {
            case 12:
                resultLabel.text = String(-firstNumber)
            case 13:
                resultLabel.text = String(firstNumber/100)
            case 14:
                resultLabel.text = String(firstNumber / result)
            case 15:
                resultLabel.text = String(firstNumber * result)
            case 16:
                resultLabel.text = String(firstNumber - result)
            case 17:
                resultLabel.text = String(firstNumber + result)
            default:
                return
            }
        }
          else if sender.tag == 11 {
            resultLabel.text = ""
            firstNumber = 0
            result = 0
            operation = 0
        }
    }
}
