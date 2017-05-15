//
//  SearchViewController.swift
//  Donaid
//
//  Created by Mendoza, Alejandro on 4/30/17.
//  Copyright © 2017 Donaid Codepath. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchBar: UISearchBar?
    var fullProjects: [HDXProject]!
    var filteredProjects: [HDXProject]!
    var showSearchResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initSearchBar()
        initTableView()
        
        HDXClient.sharedInstance?.getHDXProjectByYear(year: "2016", success: { (projects: [HDXProject]) in
            
            if (self.fullProjects != nil) {
                self.fullProjects = self.fullProjects + projects
            } else {
                self.fullProjects = projects
            }
            
            self.tableView.reloadData()
        }) { (error: Error) in
            print("HDX Client error")
        }
        
        HDXClient.sharedInstance?.getHDXProjectByYear(year: "2017", success: { (projects: [HDXProject]) in
            
            if (self.fullProjects != nil) {
                self.fullProjects = self.fullProjects + projects
            } else {
                self.fullProjects = projects
            }
            
            self.tableView.reloadData()
        }) { (error: Error) in
            print("HDX Client error")
        }
        
    }
    
    func initSearchBar() {
        searchBar = UISearchBar()
        searchBar?.placeholder = "Search World Events"
        searchBar?.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View functionality
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
        cell.project = filteredProjects[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredProjects != nil {
            if showSearchResults {
                return filteredProjects.count
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: - Search Bar Functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (fullProjects != nil) {
            self.filteredProjects = self.fullProjects.filter({ (project: HDXProject) -> Bool in
                let country = project.country
                let continent = project.continent
                let agency = project.agencyName
                let emergencyType = project.emergencyType
                let grouping = project.groupingName
                
                return ( (emergencyType!.lowercased().range(of: searchText, options: .caseInsensitive) != nil) ||
                    (agency!.lowercased().range(of: searchText, options: .caseInsensitive) != nil) ||
                    (continent!.lowercased().range(of: searchText, options: .caseInsensitive) != nil) ||
                    (country!.lowercased().range(of: searchText, options: .caseInsensitive) != nil) ||
                    (grouping!.lowercased().range(of: searchText, options: .caseInsensitive) != nil))
            })
            
            if (searchText != "") {
                showSearchResults = true
                self.tableView.reloadData()
            } else {
                showSearchResults = false
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showSearchResults = true
        searchBar.endEditing(true)
        self.tableView.reloadData()
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
