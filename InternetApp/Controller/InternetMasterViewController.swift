//
//  InternetMasterViewController.swift
//  InternetApp
//
//  Created by Jarman, Caroline on 12/17/18.
//  Copyright © 2018 ctec. All rights reserved.
//

import UIKit

public class InternetMasterViewController: UITableViewController
{
    
    private weak var internetDetail: InternetDetailViewController? = nil
    private lazy var internetTopics: [String] = [String]()
    private lazy var addresses: [String] = [String]()
    
    private func setupDetailContents() ->Void   //because not init in view controllers
    {
        internetTopics = [
        "Internet Definitions 🦈",
        "Standard Search Engine 🐙",
        "AP CSP 🐬",
        "Canyons District 🦑",
        "CTEC 🦀",
        "Social Media 🐳"
        ]
        
        
        addresses = [
        "https://docs.google.com/document/d/1Zs9wIvTgTVdi_sHOhIbYaVUsFixNSBiG826CS5HqC4I/edit",
        "https://www.google.com",
        "https://apcentral.collegeboard.org/courses/ap-computer-science-principles/course",
        "http://www.canyonsdistrict.org/",
        "https://ctec.canyonsdistrict.org/",
        "https://www.instagram.com/?hl=en"
        
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = currentControllers[0] as? InternetDetailViewController
        }
    }
    
    
    
    //this method only happens with the split view ->master page is always in there
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        setupDetailContents()
        self.clearsSelectionOnViewWillAppear = false
        
        if let split = splitViewController
        {
            let controllers = split.viewControllers
            internetDetail = (controllers[controllers.count-1]as!UINavigationController).topViewController as? InternetDetailViewController
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    public override func viewWillAppear(_ animated:Bool) -> Void
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    //MARK: - Table View
    
//    public override func tableView(_tableView: UITableView,numberOfRowsInSection section: Int ) -> Int
//    {
//        return addresses.count
//    }
    
//    public override func tableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//
//    }
    
    

    // MARK: - Table view data source

//    public override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return addresses.count
    }

    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let rowText = internetTopics[indexPath.row]
        cell.textLabel!.text = rowText

        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if(internetDetail != nil)
        {
            splitViewController?.showDetailViewController(internetDetail!,sender:nil)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
