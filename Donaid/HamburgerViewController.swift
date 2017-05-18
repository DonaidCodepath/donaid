//
//  HamburgerViewController.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController, UIScrollViewDelegate, HomeViewControllerDelegate {
    
    @IBOutlet weak var newContentView: UIView!
    @IBOutlet weak var highlightBarWidth: NSLayoutConstraint!
    @IBOutlet weak var highlightBarXPos: NSLayoutConstraint!
    @IBOutlet weak var ongoingLayoutXPos: NSLayoutConstraint!
    @IBOutlet weak var searchIconXPos: NSLayoutConstraint!
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var tabBarBottomConstraint: NSLayoutConstraint!
    
    
    
    var firstViewController: UIViewController?
    var secondViewController: UIViewController?
    
    var screenWidth: CGFloat?
    var trendingSelected = true
    var originalBottomMargin: CGFloat!
    
    var tabBarViewHiddenLevel: CGFloat!
    var tabBarViewShownLevel: CGFloat!
    
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
        ongoingLayoutXPos.constant = (screenWidth! / 4) - 22.5
        searchIconXPos.constant = (screenWidth! / 4) - 17.5

        // Do any additional setup after loading the view.
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let trendingNavigationController = storyBoard.instantiateViewController(withIdentifier: "HomeNavigationController")
        let searchNavigationController = storyBoard.instantiateViewController(withIdentifier: "SearchNavigationController")
        firstViewController = trendingNavigationController
        secondViewController = searchNavigationController
        contentViewController = trendingNavigationController
        
        
        
        let myPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        
        myPanGestureRecognizer.minimumNumberOfTouches = 1
        myPanGestureRecognizer.maximumNumberOfTouches = 1
        trendingNavigationController.view.addGestureRecognizer(myPanGestureRecognizer)
        
        tabBarViewHiddenLevel = tabBarBottomConstraint.constant -  tabBarView.frame.height
        tabBarViewShownLevel = tabBarBottomConstraint.constant
        
    }
    
    func hideTabBar() {
        tabBarView.isHidden = true
        //tabBarBottomConstraint.constant = tabBarViewHiddenLevel
    }
    
    func showTabBar() {
        tabBarBottomConstraint.constant = tabBarViewShownLevel
    }
    
    func myPanAction(recognizer: UIPanGestureRecognizer) {
        print("anything1")
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
        
        //tabBarBottomConstraint.constant -= tabBarView.frame.height
        
        if trendingSelected {
            UIView.animate(withDuration: 0.1, animations: {
                self.highlightBarXPos.constant += (self.screenWidth! / 2)
                self.view.layoutIfNeeded()
            })
        }
        
        contentViewController = secondViewController
        trendingSelected = false
    }
    
    
    @IBAction func anything(_ sender: UIPanGestureRecognizer) {
        print("anything")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let thing = scrollView.contentOffset
        print ("anything2")
    }
    
    func homeViewController(homeViewController: HomeViewController, didSelectCell: Bool) {
        print("aaaah")
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
