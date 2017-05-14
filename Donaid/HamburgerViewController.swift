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
    
    var firstViewController: UIViewController?
    var secondViewController: UIViewController?
    
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
        contentViewController = firstViewController
    }
    
    
    @IBAction func onSearchTapped(_ sender: Any) {
        print("Search tapped")
        contentViewController = secondViewController
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
