//
//  DonaidTagViewController.swift
//  Donaid
//
//  Created by Golla, Chaitanya Teja on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class FTUDonaidTagViewController: UIViewController {

    @IBOutlet weak var donaidTag: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        donaidTag.becomeFirstResponder()
        // Do any additional setup after loading the view.
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
