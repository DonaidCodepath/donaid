//
//  HamburgerViewController.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var newContentView: UIView!
    @IBOutlet weak var highlightBarWidth: NSLayoutConstraint!
    @IBOutlet weak var highlightBarXPos: NSLayoutConstraint!
    
    var firstViewController: UIViewController?
    var secondViewController: UIViewController?
    
    var screenWidth: CGFloat?
    var trendingSelected = true
    
    var contentViewController: UIViewController! {
        didSet(oldContentViewController)  {
            view.layoutIfNeeded()
            
            if (oldContentViewController != nil) {
                oldContentViewController.willMove(toParentViewController: nil)
                oldContentViewController.view.removeFromSuperview()
                oldContentViewController.removeFromParentViewController()
            }
            self.addChildViewController(contentViewController)
            contentViewController.willMove(toParentViewController: self)
            newContentView.addSubview(contentViewController.view)
            contentViewController.didMove(toParentViewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = view.bounds.width
        highlightBarWidth.constant = (screenWidth! / 2)
        

        // Do any additional setup after loading the view.
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let trendingNavigationController = storyBoard.instantiateViewController(withIdentifier: "HomeNavigationController")
        let searchNavigationController = storyBoard.instantiateViewController(withIdentifier: "SearchNavigationController")
        firstViewController = trendingNavigationController
        secondViewController = searchNavigationController
        contentViewController = trendingNavigationController
    }
    
    @IBAction func onTrendingTapped(_ sender: Any) {
        print("Trend tapped")
        if !trendingSelected {
            UIView.animate(withDuration: 0.1, animations: {
                self.highlightBarXPos.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        
        contentViewController = firstViewController
        trendingSelected = true
    }
    
    
    @IBAction func onSearchTapped(_ sender: Any) {
        print("Search tapped")
        
        if trendingSelected {
            UIView.animate(withDuration: 0.1, animations: {
                self.highlightBarXPos.constant += (self.screenWidth! / 2)
                self.view.layoutIfNeeded()
            })
        }
        
        contentViewController = secondViewController
        trendingSelected = false
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
