//
//  SplitViewController.swift
//  TipCalculator
//
//  Created by Naoki on 9/30/19.
//  Copyright © 2019 Naoki. All rights reserved.
//

import UIKit

class SplitViewController: UIViewController {

    @IBOutlet weak var splitTotal: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
//    @IBOutlet weak var splitBar: UISegmentedControl!
//    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitPPL: UITextField!
    
    var finalAmount = 0.00
    var split = 0.00
    var getSplit = 1.00
    
//    let splitBarNum = [1,2,3,4,5]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        splitTotal.text = "$" + String(finalAmount)
        splitPPL.becomeFirstResponder()
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func splitCalculator(_ sender: Any) {
        let getPPL = Double(splitPPL.text!) ?? 0
        getSplit = getPPL
        
        split = roundToPlaces(value: (finalAmount / getSplit), places: 2)
        print(split)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        splitAmount.text = "$" + String(numberFormatter.string(from:NSNumber(value:split))!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func roundToPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }
}
