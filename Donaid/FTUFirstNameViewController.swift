//
//  FTUFirstNameViewController.swift
//  Donaid
//
//  Created by Waghmare, Amol on 01/05/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class FTUFirstNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nextButtonBottomSpace: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstName.delegate = self
        
        firstName.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            nextButtonBottomSpace.constant = keyboardHeight + 5
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    @IBAction func onNext(_ sender: UIButton) {
        let userName = firstName.text
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentUserFirstName")
        defaults.set(userName, forKey: "currentUserFirstName")
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
