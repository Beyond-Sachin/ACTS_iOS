import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customTableView: DynamicTableView!
    
    var outerRow: Int = 0 {
        didSet {
            self.customTableView.reloadData()
        }
    }
    var diagonisedArray:[[Any]] = [[]]
    var dateOfDiagnosis : [String] = []
    var isFromPastDeclarationScreen : Bool = false
    var questionsArray : [String] = ["1. Have you, or anyone you have been in close contact with been diagnosed with COVID-19 or placed on quarantine for possible contact with COVID-19?","2. Have you been asked to self-isolate or quarantine by a medical professional or a local public health official?","3. Do you have a fever (temperature over 100.30F) without having taken any fever reducing medications?","4. Do you have any of the following symptoms: cough, shortness of breath, muscles aches, loss of taste and/or smell, sore throat, or chills?"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customTableView.register(UINib(nibName: "QuestionAnswerTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionAnswerTableViewCell")
        self.customTableView.register(UINib(nibName: "DiagnosisTableViewCell", bundle: nil), forCellReuseIdentifier: "DiagnosisTableViewCell")
        
        self.customTableView.estimatedRowHeight(50)
        self.customTableView.delegate = self
        self.customTableView.dataSource = self
        self.customTableView.isScrollEnabled = false
        self.customTableView.bounces = false
        self.customTableView.separatorStyle = .none
        self.customTableView.showsVerticalScrollIndicator = false
        //        layoutSubviews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.customTableView.layoutSubviews()
        self.customTableView.estimatedRowHeight(50)
    }
}

extension CustomTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isFromPastDeclarationScreen == true){
            return diagonisedArray.count
        }else {
            return questionsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Reuse custom tableview cell
        if (isFromPastDeclarationScreen == true){
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnosisTableViewCell", for: indexPath) as! DiagnosisTableViewCell
            cell.selectionStyle = .none
            cell.diagnosisLabel.text = dateOfDiagnosis[indexPath.row]
            cell.isFromPastDeclarationScreen = true
            //            cell.setValuesToCell(questionsArray[indexPath.row])
            cell.diagnosisList = diagonisedArray[indexPath.row] as! [String]
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionAnswerTableViewCell", for: indexPath) as! QuestionAnswerTableViewCell
            cell.selectionStyle = .none
            cell.setValuesToCell(questionsArray[indexPath.row])
            return cell
        }
    }
}
