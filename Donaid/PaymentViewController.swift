//
//  PaymentViewController.swift
//  Donaid
//
//  Created by Golla, Chaitanya Teja on 5/10/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController, numpadDelegate {

    
    @IBOutlet weak var numpadView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    
    var amount: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amount = "0"
        amountLabel.text = amount
        
        if let numView = Bundle.main.loadNibNamed("numpad", owner: self, options: nil)?.first as? numpad {
            numView.delegate = self
            numpadView.addSubview(numView)
        }
    }

    @IBAction func onOneClick(_ sender: Any) {
        amount = amount + "1"
        amountLabel.text = amount
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonClicked(sender: numpad, num: String) {
        
        var soFar : String = amountLabel.text!;
        if (num == "BACKSPACE") {
            soFar.remove(at: soFar.index(before: soFar.endIndex))
            amountLabel.text = soFar
        } else {
            if (soFar == "0") {
                soFar = ""
            }
            amountLabel.text = soFar + num;
            
            if (soFar.characters.count > 5) {
                amountLabel.font = amountLabel.font.withSize(50)
            } else {
                amountLabel.font = amountLabel.font.withSize(70)
            }
        }
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
