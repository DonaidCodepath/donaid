//
//  DonaidTagViewController.swift
//  Donaid
//
//  Created by Golla, Chaitanya Teja on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class FTUDonaidTagViewController: UIViewController {

    @IBOutlet weak var buttonBottomSpace: NSLayoutConstraint!
    @IBOutlet weak var donaidTag: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        donaidTag.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            buttonBottomSpace.constant = keyboardHeight + 5
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTag(_ sender: UIButton) {
        let userName = donaidTag.text
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentUserDonaidTag")
        defaults.set(userName, forKey: "currentUserDonaidTag")
        
        defaults.set("true", forKey: "currentUserRegistered")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
