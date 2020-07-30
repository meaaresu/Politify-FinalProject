//
//  presMainPageViewController.swift
//  Politify-FinalProject
//
//  Created by Apple on 7/29/20.
//  Copyright © 2020 Megan Vishal. All rights reserved.
//

import UIKit

struct presData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class presMainPageTableViewController: UITableViewController {

    var tableViewData = [presData]()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           tableViewData = [
                            presData(opened: false, title: "Donald Trump", sectionData: ["Years Served: 2016-2020", "Party Affiliation: Republican", "Cell 3"]),
                            presData(opened: false, title: "Barack Obama", sectionData: ["Years Served: 2012-2016 & 2008-2012", "Party Affiliation: Democrat", "Cell 3"]),
                            presData(opened: false, title: "Title 3", sectionData: ["Cell 1", "Cell 2", "Cell 3"]),]
       }

       override func numberOfSections(in tableView: UITableView) -> Int {
           return tableViewData.count
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if tableViewData[section].opened == true{
               return tableViewData[section].sectionData.count + 1
           } else {
               return 1
           }
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let dataIndex = indexPath.row - 1
           if indexPath.row == 0 {
               guard let cell = tableView.dequeueReusableCell(withIdentifier: "presCell") else {return UITableViewCell()}
               cell.textLabel?.text = tableViewData[indexPath.section].title
               return cell
           } else {
               //USe different cell identifiers if needed
               guard let cell = tableView.dequeueReusableCell(withIdentifier: "presCell") else {return UITableViewCell()}
               cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
               return cell
           }
       }

       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if indexPath.row == 0 {
           if tableViewData[indexPath.section].opened == true {
               tableViewData[indexPath.section].opened = false
               let sections = IndexSet.init(integer: indexPath.section)
               tableView.reloadSections(sections, with: .none)
           } else {
               tableViewData[indexPath.section].opened = true
               let sections = IndexSet.init(integer: indexPath.section)
               tableView.reloadSections(sections, with: .none)
           }
       }
       }

}

