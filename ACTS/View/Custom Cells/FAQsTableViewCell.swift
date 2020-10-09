//
//  FAQsTableViewCell.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/25/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class MyDiagnosisTableViewCell: UITableViewCell {

    @IBOutlet weak var dateOfDiagnosis: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var listOfDiagnosis : [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setValuesToCell(_ dateOfDiagnosis: String,listOfDiagnosis : [String]) {
        self.dateOfDiagnosis?.text = dateOfDiagnosis
        self.listOfDiagnosis = listOfDiagnosis
    }
}
extension MyDiagnosisTableViewCell: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartureInsideTableViewCell", for: indexPath) as!  DepartureInsideTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // cell data source
    }
}
