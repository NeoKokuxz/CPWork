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
    //for first screen
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipBar: UISegmentedControl!
    @IBOutlet weak var splitTotal: UILabel!
    
    //Global values
    var bill : Double = 0
    let tipPercentage = [0.15, 0.18, 0.20, 0]
    var tip = 0.00
    var total = 0.00
    var pta = 0.00
    
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
        tip = roundToPlaces(value: bill * tipPercentage[tipBar.selectedSegmentIndex], places: 2)
        total = tip + bill
        total = roundToPlaces(value: tip + bill, places: 2)
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
        total = 0.00
    }
    
    @IBAction func splitBtn(_ sender: Any) {
        self.pta = total
        performSegue(withIdentifier: "passTotal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SplitViewController
        vc.finalAmount = self.pta
        
    }
    
    func roundToPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }
    
}

