//
//  Issue.swift
//  Donaid
//
//  Created by Waghmare, Amol on 30/04/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class Issue: NSObject {
    
    var issueId: String?
    var issueTitle: String?
    var isFunded: String?
    var emergencyType: String?
    var country: String?
    var groupingName: String?
    var beneficiaries: Int = 0
    var agencyName: String?
    var agencyId: Int = 0
    
    init(dictionary: NSDictionary) {
        issueId = dictionary["projectID"] as? String
        issueTitle = dictionary["projectTitle"] as? String
        isFunded = dictionary["projectStatus"] as? String
        emergencyType = dictionary["emergencyTypeName"] as? String
        country = dictionary["countryName"] as? String
        groupingName = "NA" //todo figure out how to unwrap project grouping
        beneficiaries = (dictionary["beneficiariesTotal"] as? Int) ?? 0
        agencyName = dictionary["agencyName"] as? String
        agencyId = (dictionary["agencyID"] as? Int) ?? 0

    
        //tagLine = dictionary["description"] as? String
    }
    
    class func issuesWithArray(array: [NSDictionary]) -> [Issue] {
        var issues = [Issue]()
        
        for dictionary in array {
            let issue = Issue(dictionary: dictionary)
            issues.append(issue)
        }
        return issues
    }

}
