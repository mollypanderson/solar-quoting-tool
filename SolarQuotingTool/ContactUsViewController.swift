//
//  ContactUsViewController.swift
//  SolarQuotingTool
//
//  Created by Molly Anderson on 12/3/20.
//  Copyright © 2020 Molly Anderson. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {
    
    @IBOutlet weak var ContactUsTextBox: UITextView!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Thanks for contacting us!",
                                      message: "A team member will respond to your inquiry shortly.",
                                      preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default,
                                   handler: nil)
    alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        ContactUsTextBox.layer.borderWidth = 0.5
        ContactUsTextBox.layer.borderColor = borderColor.cgColor
        ContactUsTextBox.layer.cornerRadius = 5.0
    }
}
