//
//  HomeViewController.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sectionsExpanded = [Int: Bool] ()
    var splitProjects = [Int: [HDXProject]]()
    var sectionTitles = ["Syria Crisis", "CAR crisis", "South Sudan Crisis","Ebola Outbreak","Boko Haram Crisis","El Nino","Burundi Crisis","Horn of Africa Drought", "Haiti Cholera"]
    
    var fullProjects: [HDXProject] = []
    var dictProjects: [String: [HDXProject]] = [:]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        fetchAllProjects()
        
        print("made it fam")
    }
    
    func initProjects() {
        
        for project in fullProjects {
            
            if let name = project.groupingName {
                
                if dictProjects[name] == nil {
                    dictProjects[name] = []
                }
                
                dictProjects[name]?.append(project)
            }
        }
        
    }
    
    func fetchAllProjects() {
        HDXClient.sharedInstance?.getHDXProjectByYear(year: "2016", success: {[weak self] (projects: [HDXProject]) in
            
            guard let strongSelf = self else { return }
            strongSelf.fullProjects = strongSelf.fullProjects + projects
            
            
            HDXClient.sharedInstance?.getHDXProjectByYear(year: "2017", success: { (projects2017: [HDXProject]) in
                strongSelf.fullProjects = strongSelf.fullProjects + projects2017
                
                strongSelf.initProjects()
                
            }) { (error: Error) in
                print("HDX Client error")
            }
            
            strongSelf.tableView.reloadData()
        }) { (error: Error) in
            print("HDX Client error")
        }
        
        
    }
    
    func filterProjectsBySectionIndex(index: Int) {
       
        
        print("made it")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    //        HDXClient.sharedInstance?.getHDXProjectByYear(year: <#T##String#>, success: <#T##([HDXProject]) -> ()#>, failure: <#T##(Error) -> ()#>)(appId: appIdString, success: { (projects: [HDXProject]) in
    //
    //            switch appId {
    //                case 497:
    //                    self.syriaCrisisProjects = projects
    //                    break
    //                case 9:
    //                    self.carCrisisProjects = projects
    //                    break
    //                case 10:
    //                    self.southSudanProjects = projects
    //                    break
    //                case 526:
    //                    self.ebolaOutbreakProjects = projects
    //                    break
    //                case 13:
    //                    self.syriaCrisisProjects = projects
    //                    break
    //                case 14:
    //                    self.syriaCrisisProjects = projects
    //                    break
    //                case 15:
    //                    self.syriaCrisisProjects = projects
    //                    break
    //                case 16:
    //                    self.syriaCrisisProjects = projects
    //                    break
    //                default:
    //                    return
    //            }
    //
    //            self.tableView.reloadData()
    //        }) { (error: Error) in
    //            print("HDX Client error")
    //        }
}
