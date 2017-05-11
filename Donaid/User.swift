//
//  User.swift
//  Donaid
//
//  Created by Waghmare, Amol on 30/04/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class User: NSObject {

    static var _currentUser: User?
    
    var firstName: String? = ""
    var lastName: String? = ""
    var phoneNumber: String? = ""
    var verificationCode: String? = ""
    var donaidTag: String? = ""
    var cards: [PaymentInfo] = []
    var userAsDict : NSDictionary? = [String : String]() as NSDictionary
    var isRegistered : Bool = false
    
    init(dictionary: NSDictionary) {
        
        self.userAsDict = dictionary
        
        self.phoneNumber = dictionary["phoneNumber"] as? String
        self.firstName = dictionary["firstName"] as? String
        self.donaidTag = dictionary["donaidTag"] as? String
        
        if donaidTag != nil {
            self.isRegistered = true
        }
            
    }
    
    class var currentUser : User? {
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                
                let userData = defaults.object(forKey: "currentUserDict") as? Data
                
                if let userData = userData {
                    let userDict = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: userDict)
                }
            }
            
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            
            let defaults = UserDefaults.standard
            
            defaults.removeObject(forKey: "currentUserDict")
            if let user = user {
                let dataDict = try! JSONSerialization.data(withJSONObject: user.userAsDict!, options: [])
                
                defaults.set(dataDict, forKey: "currentUserDict")
            } else {
                defaults.removeObject(forKey: "currentUserDict")
            }
            defaults.synchronize()
        }
    }
}
