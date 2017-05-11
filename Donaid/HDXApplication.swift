//
//  HDXApplication.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 5/8/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class HDXApplication: NSObject {
    
    var issueId: Int = 0
    var year: Int = 0
    var agencyName: String?
    var countryID: Int = 0
    var countryName: String
    var groupName: String
    var totalAffected: Int = 0
    var appSummary: String?
    var emergencyType: String?
    
    init(dictionary: NSDictionary) {
        issueId = (dictionary["applicationID"] as? Int) ?? 0
        year = (dictionary["year"] as? Int) ?? 0
        countryID = (dictionary["countryID"] as? Int) ?? 0
        countryName = (dictionary["countryName"] as? String)!
        groupName = (dictionary["applicationgrouping.applicationgrouping[0].groupingName"] as? String) ?? ""
        totalAffected = (dictionary["totalIndividualsAffected"] as? Int) ?? 0
        emergencyType = dictionary["emergencyTypeName"] as? String
        
        let totalSummary = (dictionary["applicationSummary"] as? String) ?? ""
        if !totalSummary.isEmpty {
            let sentences = totalSummary.components(separatedBy: ".")
            appSummary = sentences[0]
        } else {
            appSummary = "No summary available"
        }
    }
    
    class func issuesWithArray(array: [NSDictionary]) -> [HDXApplication] {
        var apps = [HDXApplication]()
        
        for dictionary in array {
            let app = HDXApplication(dictionary: dictionary)
            apps.append(app)
        }
        return apps
    }

}
