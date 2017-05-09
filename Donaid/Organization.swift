//
//  Organization.swift
//  Donaid
//
//  Created by Waghmare, Amol on 30/04/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class Organization: NSObject {
    
    var orgName: String?
    var agencyCode: String?
    var agencyID: Int? = 0

    
    init(dictionary: NSDictionary) {
        orgName = dictionary["agencyName"] as? String
        agencyCode = dictionary["agencyCode"] as? String
        agencyID = (dictionary["agencyID"] as? Int) ?? 0
        
        //tagLine = dictionary["description"] as? String
    }
}
