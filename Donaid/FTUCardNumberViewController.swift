//
//  FTUCardNumberViewController.swift
//  Donaid
//
//  Created by Golla, Chaitanya Teja on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class FTUCardNumberViewController: UIViewController {

    @IBOutlet weak var First4TextField: UITextField!
    @IBOutlet weak var Second4TextField: UITextField!
    @IBOutlet weak var Third4TextField: UITextField!
    @IBOutlet weak var Last4TextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! FTUCardDetailsViewController
        destinationViewController.cardNumber = String(First4TextField.text! + Second4TextField.text! + Third4TextField.text! + Last4TextField.text!);
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
