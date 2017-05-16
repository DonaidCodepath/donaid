//
//  GroupHeaderView.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 5/15/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class GroupHeaderView: UIView {
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var groupLabel: UILabel!
    
    var caption: String? {
        get { return groupLabel?.text }
        set { groupLabel.text = newValue }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "GroupHeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        // custom initialization logic
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
