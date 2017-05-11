//
//  PaymentViewController.swift
//  Donaid
//
//  Created by Golla, Chaitanya Teja on 5/10/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    
    @IBOutlet weak var amountLabel: UILabel!
    var amount: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        amount = "0"
        amountLabel.text = amount
        // Do any additional setup after loading the view.
    }

    @IBAction func onOneClick(_ sender: Any) {
        amount = amount + "1"
        amountLabel.text = amount
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTwo(_ sender: Any) {
        amount = amount + "2"
        amountLabel.text = amount
    }
    
    @IBAction func onThree(_ sender: Any) {
        amount = amount + "3"
        amountLabel.text = amount
    }

    @IBAction func onSix(_ sender: Any) {
        amount = amount + "6"
        amountLabel.text = amount
    }
    
    @IBAction func onSeven(_ sender: Any) {
        amount = amount + "7"
        amountLabel.text = amount
    }
    
    @IBAction func onEight(_ sender: Any) {
        amount = amount + "8"
        amountLabel.text = amount
    }
    
    @IBAction func onNine(_ sender: Any) {
        amount = amount + "9"
        amountLabel.text = amount
    }
    
    @IBAction func onFour(_ sender: Any) {
        amount = amount + "4"
        amountLabel.text = amount
    }
   
    @IBAction func onZero(_ sender: Any) {
        amount = amount + "0"
        amountLabel.text = amount
    }
   
    /*
     @IBAction func onFive(_ sender: Any) {
     }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
