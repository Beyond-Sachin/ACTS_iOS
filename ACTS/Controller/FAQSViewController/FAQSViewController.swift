import UIKit
import SideMenuSwift

class FAQSViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var questionIndex = 0
    var buttonText  = ""
    
    var questionsArray : [String] = ["No question at index 1","Why don't I see the full menu list when I clicked on the Menu Icon?","Do I need to fill in my details in the My Info page?","Why do I need to do my Health Declaration daily?","What does the My Risk means?","What does the data in Contact History means?"]
    var answersArray : [String] = ["No answer at index 1","This is because you have not registered to get your 3iiD. Select My Info and click on Register to get your unique 3iiD. Once this is done, you will be able to see the full set of Menu List.","No. This is not compulsory.","In order to inform others who had been in close contact with you on your health status, it is important that you do the declaration daily while at the school premises.","My Risk complies a summary or your exposure to those who have declared certain illnesses (eg Flu, Cough etc). It also tells you if you have been in contact woth anypne who had been diagnosed recently (within the last 20 days) of any infectious viruses/ diseases.","The Contact History shows all the 3iiDs (people who have their devices with ACTS installed) around you. It will be visible in your contact history till the data is backed up on the server on a hourly basis (or whenever wifi connection is available)."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView ()
        configureNavigationBar(titleText: "FAQs")
    }
    
    func setUpTableView (){
        let nib = UINib(nibName: "FAQSTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "FAQSTableViewCell")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle:nil),
                           forCellReuseIdentifier: "HeaderTableViewCell")
        tableView?.estimatedRowHeight = 80
        tableView?.rowHeight = UITableView.automaticDimension
        self.tableView.bounces = false
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView?.estimatedRowHeight = 80
        tableView?.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
extension FAQSViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            cell.selectionStyle = .none
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FAQSTableViewCell", for: indexPath) as! FAQSTableViewCell
            cell.selectionStyle = .none
            cell.delegate =  self
            cell.expandableButton.tag = indexPath.row
            cell.questionLabel.text = questionsArray[indexPath.row]
            switch indexPath.row {
            case 1:
                if (questionIndex == 1 && buttonText == "OPEN"){
                    cell.cardViewHeight.constant = 140
                }else if (questionIndex == 1 && buttonText == "CLOSE"){
                    cell.cardViewHeight.constant = 80
                }else if (questionIndex == 0 && buttonText == ""){
                    cell.cardViewHeight.constant = 80
                }
            case 2:
                if (questionIndex == 2 && buttonText == "OPEN"){
                    cell.cardViewHeight.constant = 100
                }else if (questionIndex == 2 && buttonText == "CLOSE"){
                    cell.cardViewHeight.constant = 80
                }else if (questionIndex == 0 && buttonText == ""){
                    cell.cardViewHeight.constant = 80
                }
            case 3:
                if (questionIndex == 3 && buttonText == "OPEN"){
                    cell.cardViewHeight.constant = 145
                }else if (questionIndex == 3 && buttonText == "CLOSE"){
                    cell.cardViewHeight.constant = 80
                }else if (questionIndex == 0 && buttonText == ""){
                    cell.cardViewHeight.constant = 80
                }
            case 4:
                if (questionIndex == 4 && buttonText == "OPEN"){
                    cell.cardViewHeight.constant = 155
                }else if (questionIndex == 4 && buttonText == "CLOSE"){
                    cell.cardViewHeight.constant = 65
                }else if (questionIndex == 0 && buttonText == ""){
                    cell.cardViewHeight.constant = 65
                }
            case 5:
                if (questionIndex == 5 && buttonText == "OPEN"){
                    cell.cardViewHeight.constant = 170
                }else if (questionIndex == 5 && buttonText == "CLOSE"){
                    cell.cardViewHeight.constant = 80
                }else if (questionIndex == 0 && buttonText == ""){
                    cell.cardViewHeight.constant = 80
                }
                
            default:
                if (questionIndex == 5 && buttonText == "OPEN"){
                    cell.cardViewHeight.constant = 170
                }else if (questionIndex == 5 && buttonText == "CLOSE"){
                    cell.cardViewHeight.constant = 80
                }else if (questionIndex == 0 && buttonText == ""){
                    cell.cardViewHeight.constant = 80
                }
            }
            cell.answerLabel.text = answersArray[indexPath.row]
            return cell
        }
    }
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
}

extension FAQSViewController:ReloadTableViewDelegate{
    func reloadTableView(buttonTag: Int, buttonText: String) {
        self.questionIndex = buttonTag
        self.buttonText = buttonText
        self.tableView.reloadData()
    }
}
