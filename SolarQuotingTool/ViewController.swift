//
//  ViewController.swift
//  SolarQuotingTool
//
//  Created by Molly Anderson on 11/22/20.
//  Copyright © 2020 Molly Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    @IBOutlet weak var numSolarPanelsField: UITextField!
    @IBOutlet weak var modulePicker: UIPickerView!
    private let modulePickerOptions = [
        "Canadian Solar (41c/watt)", "Axitec (44c/watt", "thingthree", "thingfour", "thingfive"
    ]

    @IBAction func moduleButtonPressed(_ sender: UIButton) {
        let row = modulePicker.selectedRow(inComponent: 0)
        let selectedModule = modulePickerOptions[row]
        
    }
    @IBOutlet weak var wattageField: UITextField!
    @IBOutlet weak var inverterPicker: UIPickerView!
    private var inverterPickerOptions = [
        "Microinverter", "Solaredge Line Inverter + Optimizer"
    ]
    
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
        let result = calculateQuote(solarPanelsIn: solarPanels ?? 0)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: result)) else { return }
        quoteResultField.text = formattedNumber
    }
    
    @IBAction func contactSolXButton(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(identifier: "Contact Us") as! ContactUsViewController
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func shareQuoteButton(_ sender: UIButton) {
        let solarPanels = Double(numSolarPanelsField.text!)
        let wattage = Double(wattageField.text!)
        let quote = quoteResultField.text!
        // text to share
            let shareText = "SolX installation quote:  \(quote)\n\tSolar Panels: \(solarPanels!)\n\tWattage: \(wattage!)\n\nVisit sammamishsolar.com or contact info@solx2.com to schedule an on-site inspection!"
       
        let textToShare = [ shareText ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ //UIActivity.ActivityType.airDrop, //UIActivity.ActivityType.postToFacebook
        ]

        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
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
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modulePickerOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modulePickerOptions[row]
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
    }
}
    
func calculateQuote(solarPanelsIn: Double) -> Double {
        let result = 9710 + (solarPanelsIn * 178)
        return result
    }

    extension ViewController : UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    }
    
    




