//
//  numpad.swift
//  Donaid
//
//  Created by Waghmare, Amol on 13/05/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

@objc protocol numpadDelegate: class {
    @objc optional func buttonClicked(sender : numpad, num : String)
}

class numpad: UIView {
    
    weak var delegate: numpadDelegate?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func ClickBackspace(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "BACKSPACE")
    }
    @IBAction func Click0(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "0")
    }
    @IBAction func ClickDot(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: ".")
    }
    @IBAction func Click9(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "9")
    }
    @IBAction func Click8(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "8")
    }
    @IBAction func Click7(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "7")
    }
    @IBAction func Click6(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "6")
    }
    @IBAction func Click5(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "5")
    }
    @IBAction func Click4(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "4")
    }
    @IBAction func Click3(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "3")
    }
    @IBAction func Click2(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "2")
    }
    @IBAction func Click1(_ sender: UIButton) {
        delegate?.buttonClicked!(sender: self, num: "1")
    }
}
