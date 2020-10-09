//
//  ContactHistoryViewController.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/24/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class ContactHistoryViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var 3iiDLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpTableView ()
       navigationBarConfigure()
    }
    
    func setUpTableView (){
        let nib = UINib(nibName: "ContactHistoryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ContactHistoryTableViewCell")
//        self.tableHeight.constant = 100*1 + 35
//        self.tableView.isScrollEnabled = false
//        self.scrollView.bounces = false
//        self.tableView.bounces = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.showsVerticalScrollIndicator = false
    }

    func navigationBarConfigure(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .blue
        self.navigationItem.leftItemsSupplementBackButton = true
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
}

extension ContactHistoryViewController : UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
//     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))
//            label.text = "My Contact with Diagnosed Persons"
//            label.textColor = .darkGray
//            label.textAlignment = .center
//            return label
//     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactHistoryTableViewCell", for: indexPath) as! ContactHistoryTableViewCell
            cell.selectionStyle = .none
        cell.setValuesToCell("Date: 2020-09-10", contactWithID: "ID: EDH76D7D", firstContact: "First Contact: 20:48:29", lastContact: "Last Contact: 20:55:29")
            return cell
     }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
     }

}
