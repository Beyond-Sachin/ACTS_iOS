import UIKit
import SideMenuSwift

class ReportInfectionViewController: UIViewController {
    @IBOutlet weak var tableView: DynamicTableView!
    var isFromFromReportInfection : Bool = false
    var outerRow: Int = 0 {
        didSet {
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(titleText: "Health Declaration")
        setUpTableView ()
    }
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    func setUpTableView (){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.tableView.register(UINib(nibName: "SelfDeclarationTableViewCell", bundle: nil), forCellReuseIdentifier: "SelfDeclarationTableViewCell")
        self.tableView.register(UINib(nibName: "ReportInfectionTableViewCell", bundle: nil), forCellReuseIdentifier: "ReportInfectionTableViewCell")
        self.tableView.bounces = false
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.showsVerticalScrollIndicator = true
    }
}
extension ReportInfectionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelfDeclarationTableViewCell", for: indexPath) as! SelfDeclarationTableViewCell
            cell.selectionStyle = .none
            if (isFromFromReportInfection == true){
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM yyyy"
                let result = formatter.string(from: date)
                cell.headingLabel.text = "Report Infection"
                cell.threeIIDLabel.text = "4D45DREG3"
                cell.dateLabel.text = result
            }else {
                cell.headingLabel.text = "Past Declarations"
                cell.threeIIDLabel.text = "(Past 15 days)"
                cell.dateLabel.text = "3IID: 4D45DREG3"
            }
            return cell
        }
        else {
            if (isFromFromReportInfection == true){
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReportInfectionTableViewCell", for: indexPath) as! ReportInfectionTableViewCell
                cell.selectionStyle = .none
                cell.delegate = self
                cell.layoutSubviews()
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
                cell.isFromPastDeclarationScreen = true
                cell.diagonisedArray = [["Status: Well"],["Status: Well"],["Status: Well"]]
                cell.dateOfDiagnosis = ["Date: 2020-09-07","Date: 2020-08-07","Date: 2020-06-05"]
                cell.selectionStyle = .none
                cell.layoutSubviews()
                return cell
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}
extension ReportInfectionViewController: ReportInfectionScreenDelegate {
    func navigateToPreviousScreen() {
        navigateToHealthDeclarationScreen()
    }
    func navigateToReportInfectionScreen(isFromFromReportInfection : Bool) {
    }
}
