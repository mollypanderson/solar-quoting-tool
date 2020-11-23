//
//  ViewController.swift
//  SolarQuotingTool
//
//  Created by Molly Anderson on 11/22/20.
//  Copyright © 2020 Molly Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numSolarPanelsField: UITextField!
    @IBOutlet weak var modulePicker: UIPickerView!
    @IBOutlet weak var wattageField: UITextField!
    @IBOutlet weak var inverterPicker: UIPickerView!
    @IBOutlet weak var quoteResultField: UITextField!
    
    @IBAction func calculateButton(_ sender: UIButton) {
        var solarPanels = Double(numSolarPanelsField.text!)
        var wattage = Double(wattageField.text!)
        
        // initialize/defaults
        if solarPanels == nil {
            solarPanels = 0.0
        }
        if wattage == nil {
            wattage = 0.0
        }
        
        // calculation
        let result = calculateQuote(solarPanelsIn: solarPanels ?? 0, wattageIn: wattage ?? 0)
        quoteResultField.text = String(format: "$%.2f", result)
    }
    
    @IBAction func contactSolXButton(_ sender: UIButton) {
    }
    
    @IBAction func shareQuoteButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
            
            view.addGestureRecognizer(tap)
        
        numSolarPanelsField.delegate = self
      //  modulePicker.delegate = self
        wattageField.delegate = self
       // inverterPicker.delegate = self
        quoteResultField.delegate = self
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
    }
}
    
    func calculateQuote(solarPanelsIn: Double, wattageIn: Double) -> Double {
        let result = solarPanelsIn + wattageIn
        return result
    }
    
    extension ViewController : UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    }
    
    




