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
    
    var expanded: Bool!
    
    var caption: String? {
        get { return groupLabel?.text }
        set { groupLabel.text = newValue }
    }
    
    var myBool: Bool? {
        get { return expanded }
        set { expanded = newValue }
    }
    
    var headerArrow: UIImage? {
        get { return arrowImage.image }
        set { arrowImage.image = newValue }
    }
    
    init(frame: CGRect, expanded: Bool!) {
        super.init(frame: frame)
        self.expanded = expanded
        initSubviews()
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
        
        if (expanded != nil) {
            if (self.expanded == true) {
                print("Hit init in expanded state")
                self.arrowImage.image = #imageLiteral(resourceName: "arrowUp")
            } else {
                print("retracted state")
                self.arrowImage.image = #imageLiteral(resourceName: "arrowUp")
            }
        } else {
            self.arrowImage = UIImageView(image: #imageLiteral(resourceName: "arrowUp"))
        }
        // custom initialization logic
        
        
        
    }
    
    func rotateArrow(expanded: Bool) {
        //UIView.animate(withDuration: 0.1, animations: {
        //    self.arrowImage.transform = self.arrowImage.transform.rotated(by: CGFloat(M_PI_2))
        //})
        //UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
        //    self.arrowImage.transform = self.arrowImage.transform.rotated(by: CGFloat(M_PI_2))
        //    self.arrowImage = UIImageView(image: #imageLiteral(resourceName: "arrowUp"))
       // }) { (bool: Bool) in
         //   print(bool)
       //     self.arrowImage = UIImageView(image: #imageLiteral(resourceName: "arrowUp"))
       // }
        
        if expanded {
            self.arrowImage.image = #imageLiteral(resourceName: "arrowUp")
        } else {
            self.arrowImage.image = #imageLiteral(resourceName: "arrowDown")
        }
        
        //self.arrowImage.transform = self.arrowImage.transform.rotated(by: CGFloat(M_PI_2))
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
