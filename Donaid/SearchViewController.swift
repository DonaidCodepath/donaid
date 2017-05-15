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
    var projects2016: [HDXProject]!
    var projects2017: [HDXProject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        HDXClient.sharedInstance?.getHDXProjectByYear(year: "2016", success: { (projects: [HDXProject]) in
            self.projects2016 = projects
            self.tableView.reloadData()
        }) { (error: Error) in
            print("HDX Client error")
        }
        
        HDXClient.sharedInstance?.getHDXProjectByYear(year: "2017", success: { (projects: [HDXProject]) in
            self.projects2017 = projects
            
            self.tableView.reloadData()
        }) { (error: Error) in
            print("HDX Client error")
        }
        
        
        
        createSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSearchBar() {
        searchBar = UISearchBar()
        searchBar?.placeholder = "Search World Events"
        searchBar?.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
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
