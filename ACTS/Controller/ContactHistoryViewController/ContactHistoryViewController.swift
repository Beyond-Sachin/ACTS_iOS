//
//  ContactHistoryViewController.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/24/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class ContactHistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var threeDoubleIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView ()
        configureNavigationBar(titleText: "Contact History")
    }
    
    func setUpTableView (){
        let nib = UINib(nibName: "ContactHistoryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ContactHistoryTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
}

extension ContactHistoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
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
