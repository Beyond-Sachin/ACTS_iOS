//
//  InnerTableViewCell.swift
//  AutoHeightIncrementTableViewDemo
//
//  Created by Wholly-iOS on 22/09/18.
//  Copyright © 2018 Ashvin Gudaliya. All rights reserved.
//

import UIKit

class DiagnosisCardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var innerTableView: DynamicTableView!
    
    var outerRow: Int = 0 {
        didSet {
            self.innerTableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerTableView.register(UINib(nibName: "DiagnosisTableViewCell", bundle: nil), forCellReuseIdentifier: "DiagnosisTableViewCell")
        self.innerTableView.estimatedRowHeight(100)
        self.innerTableView.delegate = self
        self.innerTableView.dataSource = self
        self.innerTableView.isScrollEnabled = false
        self.innerTableView.bounces = false
        self.innerTableView.separatorStyle = .none
        self.innerTableView.showsVerticalScrollIndicator = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.innerTableView.layoutSubviews()
        self.innerTableView.estimatedRowHeight(100)
        self.innerTableView.beginUpdates()
        self.innerTableView.endUpdates()
        self.superTableView?.beginUpdates()
        self.superTableView?.endUpdates()
    }
}

extension DiagnosisCardTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnosisTableViewCell", for: indexPath) as! DiagnosisTableViewCell
        if (indexPath.row == 0){
            cell.diagnosisList = ["Sachin","Arnav","Abhi"]
            
        }else if (indexPath.row == 1){
            cell.diagnosisList = ["Sachin","Arnav"]
        }else {
            cell.diagnosisList = ["Sachin","Arnav","Abhi","Poonam","Ram"]
        }
        cell.diagnosisLabel?.text = "Sachin"
        cell.selectionStyle = .none
        return cell
    }
}
