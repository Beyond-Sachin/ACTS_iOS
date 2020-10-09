//
//  DiagnosisQuestionsTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/27/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class DiagnosisQuestionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableView: DynamicTableView!
    
    var outerRow: Int = 0 {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableView.register(UINib(nibName: "labelTableViewCell", bundle: nil), forCellReuseIdentifier: "labelTableViewCell")
        self.tableView.register(UINib(nibName: "QuestionAnswerTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionAnswerTableViewCell")
        self.tableView.register(UINib(nibName: "QuestionAnswerTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionAnswerTableViewCell")
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        
        self.tableView.estimatedRowHeight(400)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isScrollEnabled = false
        self.tableView.bounces = false
        //            self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
//        layoutSubviews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.tableView.layoutSubviews()
        self.tableView.estimatedRowHeight(400)
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        //        self.tableView.reloadData()
        self.superTableView?.beginUpdates()
        self.superTableView?.endUpdates()
        //        self.superTableView?.reloadData()
        
    }
}

extension DiagnosisQuestionsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelTableViewCell", for: indexPath) as! labelTableViewCell
            cell.selectionStyle = .none
            cell.diagnosisLabel.font = UIFont.systemFont(ofSize: 16)
            cell.diagnosisLabel.textAlignment = .center
            cell.diagnosisLabel.text = "\nKindly review this COVID-19 Daily Self-Check EACH DAY before reposrting to campus answer the following questions. If you reply yes to any of the questions, STAY HOME and follow the direction at the bottom of the page.\n"
            return cell
        }else if (indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelTableViewCell", for: indexPath) as! labelTableViewCell
            cell.selectionStyle = .none
            cell.diagnosisLabel.textAlignment = .center
            cell.diagnosisLabel.font = UIFont.systemFont(ofSize: 16)
            cell.diagnosisLabel.text = "\nIMPORTANT:\n\nIf you answered YES to any of the questions above, do not report to work. Contact your supervisor Human Resources IMMEDIATELY\n\n If you start feeling sick at any point during your work shift or presence in the campus, contact your supervisor Human Resources IMMEDIATELY\n"
            return cell
        }
    }
}
