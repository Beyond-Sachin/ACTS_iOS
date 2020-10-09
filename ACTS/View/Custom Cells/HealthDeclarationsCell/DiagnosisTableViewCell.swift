//
//  DiagnosisTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/25/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class DiagnosisTableViewCell: UITableViewCell {
    @IBOutlet weak var diagnosisLabel: UILabel!
    @IBOutlet weak var tableView: DynamicTableView!
    @IBOutlet weak var tableViewWidth: NSLayoutConstraint!
    var diagnosisList:[String] = []
    var isFromPastDeclarationScreen : Bool = false
    
    var outerRow: Int = 0 {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.tableView.register(UINib(nibName: "labelTableViewCell", bundle: nil), forCellReuseIdentifier: "labelTableViewCell")
        self.tableView.estimatedRowHeight(50)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isScrollEnabled = false
        self.tableView.bounces = false
        self.tableView.separatorStyle = .none
        if (isFromPastDeclarationScreen == true){
            self.tableViewWidth.constant = 140
        }else {
            self.tableViewWidth.constant = 100
        }
        self.tableView.showsVerticalScrollIndicator = false        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        self.tableView.layoutSubviews()
        self.superTableView?.beginUpdates()
        self.superTableView?.endUpdates()
        if (isFromPastDeclarationScreen == true){
            self.tableViewWidth.constant = 105
        }else {
            self.tableViewWidth.constant = 100
        }
        super.layoutSubviews()
    }
    
}
extension DiagnosisTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diagnosisList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelTableViewCell", for: indexPath) as! labelTableViewCell
        cell.diagnosisLabel?.text = diagnosisList[indexPath.row]
        cell.diagnosisLabel.numberOfLines = 0
        cell.diagnosisLabel.sizeToFit()
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
