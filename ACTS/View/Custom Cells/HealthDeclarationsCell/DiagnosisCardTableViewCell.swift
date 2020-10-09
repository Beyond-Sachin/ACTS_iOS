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
    var delegate : ReportInfectionScreenDelegate?
    var outerRow: Int = 0 {
        didSet {
            self.innerTableView.reloadData()
        }
    }
    var dateOfDiagnosis : [String] = ["2020-09-07","2020-08-07","2020-06-05","2020-06-05"]
    var diagonisedArray  = [ ["Sars","Covid","Measles","Malaria","Tuberculosis"], ["Tuberculosis"], ["Sars","Covid","Measles"],["Sars",]]
    
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
        layoutSubviews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func reportDiagnosis_pressed(_ sender: Any) {
        AppDelegate.sharedInstance().isFromFromReportInfectionScreen =  true
        self.delegate?.navigateToReportInfectionScreen(isFromFromReportInfection : true)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.innerTableView.layoutSubviews()
        self.innerTableView.estimatedRowHeight(100)
        self.innerTableView.beginUpdates()
        self.innerTableView.endUpdates()
        self.innerTableView.reloadData()
        self.superTableView?.beginUpdates()
        self.superTableView?.endUpdates()
        //        self.superTableView?.reloadData()
    }
}

extension DiagnosisCardTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diagonisedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnosisTableViewCell", for: indexPath) as! DiagnosisTableViewCell
        
        //        print("diagonisedArray[indexPath.row]->",diagonisedArray[indexPath.row][indexPath.section])
        
        cell.diagnosisList = diagonisedArray[indexPath.row]
        //        if (indexPath.row == 0){
        //            cell.diagnosisList = ["Sars","Covid","Measles","Malaria","Tuberculosis"]
        //
        //        }else if (indexPath.row == 1){
        //            cell.diagnosisList = ["Tuberculosis"]
        //        }else {
        //            cell.diagnosisList = ["Covid","Measles","Malaria"]
        //        }
        cell.diagnosisLabel?.text = "Date: \(dateOfDiagnosis[indexPath.row])"
        cell.selectionStyle = .none
        return cell
    }
}
