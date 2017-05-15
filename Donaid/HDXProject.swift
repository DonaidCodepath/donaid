//
//  HDXProject.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 5/8/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class HDXProject: NSObject {
    
    var issueId: String?
    var issueTitle: String?
    var isFunded: String?
    var emergencyType: String?
    var country: String?
    var continent: String?
    var region: String?
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
        continent = dictionary["continentName"] as? String
        region = dictionary["regionName"] as? String
        groupingName = "NA" //todo figure out how to unwrap project grouping
        beneficiaries = (dictionary["beneficiariesTotal"] as? Int) ?? 0
        agencyName = dictionary["agencyName"] as? String
        agencyId = (dictionary["agencyID"] as? Int) ?? 0
    }
    
    class func issuesWithArray(array: [NSDictionary]) -> [HDXProject] {
        var apps = [HDXProject]()
        
        for dictionary in array {
            let app = HDXProject(dictionary: dictionary)
            apps.append(app)
        }
        return apps
    }
}
