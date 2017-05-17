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
    @IBOutlet weak var arrowImage: UIImageView!
    
    var didSetArrowImage = false
    
    var caption: String? {
        get { return groupLabel?.text }
        set { groupLabel.text = newValue }
    }
    
    var arrow: UIImageView? {
        get { return arrowImage }
        set { arrowImage = newValue }
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
        if !didSetArrowImage {
            print("Hit the init of header")
            arrowImage.transform = arrowImage.transform.rotated(by: CGFloat(M_PI_2))
        }
        
        
    }
    
    func rotateArrow() {
        //UIView.animate(withDuration: 0.1, animations: {
        //    self.arrowImage.transform = self.arrowImage.transform.rotated(by: CGFloat(M_PI_2))
        //})
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.arrowImage.transform = self.arrowImage.transform.rotated(by: CGFloat(M_PI_2))
        }) { (bool: Bool) in
            print(bool)
            
        }
        self.arrowImage.transform = self.arrowImage.transform.rotated(by: CGFloat(M_PI_2))
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
