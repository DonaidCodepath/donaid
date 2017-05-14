//
//  FTUVerificationcodeViewController.swift
//  Donaid
//
//  Created by Waghmare, Amol on 01/05/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class FTUVerificationcodeViewController: UIViewController, numpadDelegate {

    
    @IBOutlet weak var Code1: UITextField!
    @IBOutlet weak var Code2: UITextField!
    @IBOutlet weak var Code3: UITextField!
    @IBOutlet weak var Code4: UITextField!
    
    weak var numpad: numpad?
    
    @IBOutlet weak var numpadView: UIView!
    var fullCode:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let numView = Bundle.main.loadNibNamed("numpad", owner: self, options: nil)?.first as? numpad {
            numView.delegate = self
            numpadView.addSubview(numView)
        }
    }
    
    func buttonClicked(sender: numpad, num: String) {
        
        if (num != "BACKSPACE") {
            if (fullCode == nil) {
                fullCode = num
            }
            else if (fullCode.characters.count > 0 && fullCode.characters.count < 4) {
                fullCode = fullCode + num
            }
        }
        else {
            if (fullCode != nil && fullCode.characters.count > 0) {
                fullCode.remove(at: fullCode.index(before: fullCode.endIndex))
            }
        }

        if (fullCode != nil) {
            let code:String = fullCode
            if (fullCode.characters.count > 0 && fullCode.characters.count <= 4) {
                if (fullCode.characters.count > 3) {
                    let char4 = code[code.index(code.startIndex, offsetBy: 3)]
                    Code4.text = String(char4)
                }
                if (fullCode.characters.count > 2) {
                    let char3 = code[code.index(code.startIndex, offsetBy: 2)]
                    Code3.text = String(char3)
                }
                if (fullCode.characters.count > 1) {
                    let char2 = code[code.index(code.startIndex, offsetBy: 1)]
                    Code2.text = String(char2)
                }
                if (fullCode.characters.count > 0) {
                    let char1 = code[code.index(code.startIndex, offsetBy: 0)]
                    Code1.text = String(char1)
                }
            }
        }
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
