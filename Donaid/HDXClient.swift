//
//  HDXClient.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 5/7/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class HDXClient: BDBOAuth1SessionManager {
    
    //static let sharedInstance = HDXClient(baseURL:
    static let sharedInstance = HDXClient(baseURL: NSURL(string: "https://cerfgms-webapi.unocha.org")! as URL!, consumerKey: nil, consumerSecret: nil)
    
    
    
    func getAllProjects(success: @escaping ([Issue]) -> (), failure: @escaping (Error) -> ()) {
        get("/v1/project/All.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) -> Void in
            let dictionaries = response as! [NSDictionary]
            
            let issues = Issue.issuesWithArray(array: dictionaries)
            success(issues)
        }, failure: { (task: URLSessionDataTask?, error: Error) -> Void in
            failure(error)
        })
    }
    
    func getApplicationByYear(year: String, success: @escaping ([HDXApplication]) -> (), failure: @escaping (Error) -> ()) {
        let endpoint = "/v1/application/" + year + ".json"
        
        get(endpoint, parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) -> Void in
            let dictionaries = response as! [NSDictionary]
            
            let apps = HDXApplication.issuesWithArray(array: dictionaries)
            success(apps)
        }, failure: { (task: URLSessionDataTask?, error: Error) -> Void in
            failure(error)
        })
    }
    
    func getHDXProjectByApplicationID(appId: String, success: @escaping ([HDXProject]) -> (), failure: @escaping (Error) -> ()) {
        let endpoint = "/v1/project/id/" + appId + ".json"
        
        get(endpoint, parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) -> Void in
            let dictionaries = response as! [NSDictionary]
            
            let apps = HDXProject.issuesWithArray(array: dictionaries)
            success(apps)
        }, failure: { (task: URLSessionDataTask?, error: Error) -> Void in
            failure(error)
        })
    }

    func getHDXProjectByYear(year: String, success: @escaping ([HDXProject]) -> (), failure: @escaping (Error) -> ()) {
        let endpoint = "/v1/project/year/" + year + ".json"
        
        get(endpoint, parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any?) -> Void in
            let dictionaries = response as! [NSDictionary]
            
            let apps = HDXProject.issuesWithArray(array: dictionaries)
            success(apps)
        }, failure: { (task: URLSessionDataTask?, error: Error) -> Void in
            failure(error)
        })
    }
}
