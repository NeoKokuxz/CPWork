//
//  ViewController.swift
//  TipCalculator
//
//  Created by Naoki on 9/13/19.
//  Copyright © 2019 Naoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipBar: UISegmentedControl!
    
    //Global values
    var bill : Double = 0
    let tipPercentage = [0.15, 0.18, 0.20, 0]
    var tip = 0.00
    var total = 0.00
    
    @IBAction func tipBar(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        //Set numberpad always visible
        billAmount.becomeFirstResponder()
    }
    @IBAction func onTap(_ sender: Any) {
        //This prevents number pad disappear
        //view.endEditing(true)
    }
    @IBAction func resetButton(_ sender: UIButton) {
        updateUI()
        }
    
    @IBAction func TipCalculate(_ sender: Any) {
        
        //Get bill
        let getBill = Double(billAmount.text!) ?? 0
        bill = getBill
        //Calculate tip and total
        tip = bill * tipPercentage[tipBar.selectedSegmentIndex]
        total = tip + bill
        //Update the labels
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        //Set thousand places
        tipLabel.text = "$" + String(numberFormatter.string(from:NSNumber(value:tip))!)
        totalAmount.text =  "$" + String(numberFormatter.string(from: NSNumber(value:total))!)
    }
    
    func updateUI(){
        //Reset all the informations
        billAmount.text = ""
        tipLabel.text = String(format: "$%.2f", 0)
        totalAmount.text = String(format: "$%.2f", 0)
        tipBar.selectedSegmentIndex = 0
    }
}
