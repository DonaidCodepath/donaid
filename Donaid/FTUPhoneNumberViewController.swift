//
//  FTUPhoneNumberViewController.swift
//  Donaid
//
//  Created by Waghmare, Amol on 01/05/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class FTUPhoneNumberViewController: UIViewController {

    @IBOutlet weak var phoneNumberText: UITextField!
    @IBAction func onSendCode(_ sender: UIButton) {
        var updatedUser = User.currentUser
        updatedUser?.phoneNumber = phoneNumberText.text
        User.currentUser = updatedUser
    }
    
    
    @IBAction func on1(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "1";
    }
    @IBAction func on2(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "2";
    }
    @IBAction func on3(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "3";
    }
    @IBAction func on4(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "5";
    }
    
    @IBAction func on5(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "5";
    }
    @IBAction func on6(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "6";
    }
    @IBAction func on7(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "7";
    }
    @IBAction func on8(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "8";
    }
    @IBAction func on9(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "9";
    }
    @IBAction func on0(_ sender: UIButton) {
        let soFar = phoneNumberText.text;
        phoneNumberText.text = soFar! + "0";
    }
    @IBAction func onDelete(_ sender: UIButton) {
        var soFar : String = phoneNumberText.text!;
        soFar.remove(at: soFar.index(before: soFar.endIndex))
        phoneNumberText.text = soFar
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
