import UIKit

class MyRiskViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView ()
        configureNavigationBar(titleText: "My Risk")
    }
    
    func setUpTableView (){
        let nib = UINib(nibName: "MyRiskTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MyRiskTableViewCell")
        self.tableHeight.constant = 100*5 + 35
        self.tableView.isScrollEnabled = false
        self.scrollView.bounces = false
        self.tableView.bounces = false
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
}

extension MyRiskViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))
        label.text = "My Contact with Diagnosed Persons"
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRiskTableViewCell", for: indexPath) as! MyRiskTableViewCell
        cell.selectionStyle = .none
        //            cell.setValuesToCell("Sachin", contactWithID: "EDH76D7D")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == self.scrollView {
//            //            tableView.isScrollEnabled = (self.scrollView.contentOffset.y >= 200)
//        }
//
//        if scrollView == self.tableView {
//            //            self.tableView.isScrollEnabled = (tableView.contentOffset.y > 0)
//        }
//    }
}
