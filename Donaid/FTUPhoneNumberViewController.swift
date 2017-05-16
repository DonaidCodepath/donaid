//
//  FTUPhoneNumberViewController.swift
//  Donaid
//
//  Created by Waghmare, Amol on 01/05/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class FTUPhoneNumberViewController: UIViewController, numpadDelegate {
    
    @IBOutlet weak var numpadView: UIView!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBAction func onSendCode(_ sender: UIButton) {
//        var updatedUser = User.currentUser
//        updatedUser?.phoneNumber = phoneNumberText.text
//        User.currentUser = updatedUser
    }
    
    func buttonClicked(sender: numpad, num: String) {
        
        var soFar : String = phoneNumberText.text!;
        if (num == "BACKSPACE") {
            
            soFar.remove(at: soFar.index(before: soFar.endIndex))
            phoneNumberText.text = soFar
        } else {
            phoneNumberText.text = soFar + num;
        }
    }
    
    
    @IBAction func onDelete(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let numView = Bundle.main.loadNibNamed("numpad", owner: self, options: nil)?.first as? numpad {
            numView.delegate = self
            numpadView.addSubview(numView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
