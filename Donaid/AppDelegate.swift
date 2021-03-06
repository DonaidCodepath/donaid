//
//  AppDelegate.swift
//  Donaid
//
//  Created by Golla, Chaitanya Teja on 4/24/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
//        UINavigationBar.appearance().barTintColor = UIColor(red: 233/255, green: 30/255, blue: 99/255, alpha: 1)
//        UINavigationBar.appearance().isTranslucent = true
//        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
//        UIApplication.shared.statusBarStyle = .lightContent
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let hamburgerVC = storyBoard.instantiateViewController(withIdentifier: "HamburgerViewController") as! HamburgerViewController
        let trendingNavigationController = storyBoard.instantiateViewController(withIdentifier: "HomeNavigationController")
//        let searchNavigationController = storyBoard.instantiateViewController(withIdentifier: "SearchNavigationController")
        hamburgerVC.firstViewController = trendingNavigationController
//        hamburgerVC.secondViewController = searchNavigationController
        hamburgerVC.contentViewController = trendingNavigationController
        
        //let loggedOutUserController = storyBoard.instantiateViewController(withIdentifier: "LoginViewCotroller")
        
        var startFTU = true
        
        let defaults = UserDefaults.standard
        //defaults.removeObject(forKey: "currentUserRegistered") //uncomment this if you wan to launch FTU flow again
        
        let isUserRegistered = defaults.object(forKey: "currentUserRegistered") as? String
        if (isUserRegistered == "true") {
            startFTU = false
        }
        
        
        if (startFTU == true) {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            
            window?.rootViewController = viewController
        } else {
            let userDict: NSDictionary = [String : String]() as NSDictionary
            let newUser: User = User(dictionary: userDict)
            User.currentUser = newUser
            
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            let hamburgerVC = storyBoard.instantiateViewController(withIdentifier: "HamburgerViewController") as! HamburgerViewController
            //let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let homeNavigationController = storyBoard.instantiateViewController(withIdentifier: "HomeNavigationController")
            hamburgerVC.contentViewController = homeNavigationController
            
            window?.rootViewController = hamburgerVC
        }
        
        NotificationCenter.default.addObserver(forName: .userDidLogoutNotificationName, object: nil, queue: OperationQueue.main) { (notification: Notification!) in
            
            print("UserDidlogout")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            
            self.window?.rootViewController = viewController
            
        }
        
        NotificationCenter.default.addObserver(forName: .userSelectedProject, object: nil, queue: OperationQueue.main) { (notification: Notification!) in
            
            print("We made it here fam 1")
            //let hamburgerVC = storyBoard.instantiateViewController(withIdentifier: "HamburgerViewController") as? HamburgerViewController
            //print(self.window?.rootViewController?.navigationController)
            let controller = self.window?.rootViewController as! HamburgerViewController
            controller.hideTabBar()
            //hamburgerVC?.hideTabBar()
        }
        
        

        
        return true
    }
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

