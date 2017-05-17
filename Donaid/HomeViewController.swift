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
    var fullProjects: [HDXProject] = []
    var projectsByGrouping: [String: [HDXProject]] = [:]
    var sectionTitles = ["Syria Crisis", "CAR Crisis", "South Sudan Crisis","Ebola Outbreak","Boko Haram Crisis","El Nino","Burundi Crisis","Horn of Africa Drought", "Haiti Cholera"]
    var groupingNames = ["Syria crisis 2011-2016", "CAR crisis 2013-2016", "South Sudan crisis 2013-2016","Ebola outbreak 2014-2015","Boko Haram crisis 2014-2016","El Nino 2015-2016","Burundi crisis 2015-2016","Horn of Africa Drought 2017", "Haiti Cholera"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "smallDonaidLogo2"))

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        initSections()
        fetchAllProjects()
        
    }
    
    func initSections() {
        for (index, _) in sectionTitles.enumerated() {
            sectionsExpanded[index] = false
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
    
    func initProjects() {
        for project in fullProjects {
            
            if let group = project.groupingName {
                if projectsByGrouping[group] == nil {
                    projectsByGrouping[group] = []
                }
                
                projectsByGrouping[group]?.append(project)
            }
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if projectsByGrouping.count > 0 {
            if !sectionsExpanded[section]! {
                return 0
            } else {
                let groupingProjects = getProjectsBySection(section: section)
                return groupingProjects.count
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sectionsExpanded[indexPath.section]! {
            return UITableViewAutomaticDimension
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        if projectsByGrouping.count > 0 {
            let groupingProjects = getProjectsBySection(section: indexPath.section)
            if groupingProjects.count > 0 {
                if let project = groupingProjects[indexPath.row] as HDXProject? {
                    cell.project = project
                }
            }
            
        }

        return cell
    }
    
    func test(sender: UITapGestureRecognizer){
        //using sender, we can get the point in respect to the table view
        let view = sender.view as! GroupHeaderView
        let section = view.tag as Int!
        
        //view.expanded = sectionsExpanded[section!]!
        
        if sectionsExpanded[section!]! {
            view.rotateArrow(expanded: false)
            
            sectionsExpanded[section!] = false
            //view.headerArrow = #imageLiteral(resourceName: "arrowDown")
        } else {
            view.rotateArrow(expanded: true)
            sectionsExpanded[section!] = true
            //view.headerArrow = #imageLiteral(resourceName: "arrowUp")
        }
        
        tableView.reloadSections(IndexSet(integer: section!), with: .automatic)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let headerView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 60))
        let isSectionExpanded = sectionsExpanded[section]!
        let headerView = GroupHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60), expanded: isSectionExpanded)
        headerView.caption = sectionTitles[section]
        if (isSectionExpanded) {
            headerView.headerArrow = #imageLiteral(resourceName: "arrowUp")
        } else {
            headerView.headerArrow = #imageLiteral(resourceName: "arrowDown")
        }
        headerView.tag = section
        let gesture = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.test))
        headerView.addGestureRecognizer(gesture)
        return headerView
    }
    
    func getProjectsBySection(section: Int) -> [HDXProject] {
        if (projectsByGrouping.count > 0) {
            let groupingToGet = groupingNames[section]
            if let groupingProjects = projectsByGrouping[groupingToGet] as [HDXProject]? {
                return groupingProjects
            } else {
                return []
            }
            
        } else {
            return []
        }
        
    }
    
    
    @IBAction func onLogoutTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentUserRegistered")
        
        NotificationCenter.default.post(name: .userDidLogoutNotificationName, object: nil)
        //let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        //let loginController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
        
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
