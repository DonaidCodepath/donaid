//
//  SuccessViewController.swift
//  Donaid
//
//  Created by Golla, Chaitanya Teja on 5/16/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var completeView: UIView!
    @IBOutlet weak var donationLabel: UILabel!
    @IBOutlet weak var refreshImageView: UIImageView!
    @IBOutlet weak var doneImageView: UIImageView!
    @IBOutlet weak var donateImageView: UIImageView!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView();
    override func viewDidLoad() {
        super.viewDidLoad()
        completeView.isHidden = true
        refreshImageView.isHidden = true
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
//        UIView.animate(withDuration: 3, animations: {
//            self.refreshImageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
//            self.completeView.alpha = 1.0
//        })
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.activityIndicator.stopAnimating()
            self.completeView.isHidden = false
        }
        
        UIApplication.shared.beginIgnoringInteractionEvents()

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
