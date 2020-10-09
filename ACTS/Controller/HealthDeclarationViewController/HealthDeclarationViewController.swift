//
//  FAQ2ViewController.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/25/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit

class HealthDeclarationViewController: UIViewController {
    
    @IBOutlet weak var myDiagnosisTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(titleText: "Health Declaration")
        setUpTableView ()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.estimatedRowHeight = 80
        tableView?.rowHeight = UITableView.automaticDimension
//        tableView.reloadData()
//        let parent = view.superview
//        view.removeFromSuperview()
//        view = nil
//        parent?.addSubview(view) //
        
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    func setUpTableView (){
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UINib(nibName: "MyDiagnosisTableViewCell", bundle: nil), forCellReuseIdentifier: "MyDiagnosisTableViewCell")
        self.tableView?.register(UINib(nibName: "PastDeclarationsTableViewCell", bundle: nil), forCellReuseIdentifier: "PastDeclarationsTableViewCell")
        self.tableView?.register(UINib(nibName: "SelfDeclarationTableViewCell", bundle: nil), forCellReuseIdentifier: "SelfDeclarationTableViewCell")
        self.tableView?.register(UINib(nibName: "DiagnosisCardTableViewCell", bundle: nil), forCellReuseIdentifier: "DiagnosisCardTableViewCell")
        self.tableView?.register(UINib(nibName: "DiagnosisQuestionsTableViewCell", bundle: nil), forCellReuseIdentifier: "DiagnosisQuestionsTableViewCell")
        self.tableView?.bounces = false
        self.tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView?.showsVerticalScrollIndicator = true
    }
}

extension HealthDeclarationViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelfDeclarationTableViewCell", for: indexPath) as! SelfDeclarationTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnosisQuestionsTableViewCell", for: indexPath) as! DiagnosisQuestionsTableViewCell
            cell.selectionStyle = .none
            cell.layoutSubviews()
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PastDeclarationsTableViewCell", for: indexPath) as! PastDeclarationsTableViewCell
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiagnosisCardTableViewCell", for: indexPath) as! DiagnosisCardTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            cell.layoutSubviews()
            return cell
        }
    }
}
extension HealthDeclarationViewController: ReportInfectionScreenDelegate {
    
    func navigateToReportInfectionScreen(isFromFromReportInfection: Bool) {
        navigateToReportInfectionViewScreen(isFromFromReportInfection: isFromFromReportInfection)
    }
    func navigateToPreviousScreen() {
        
    }
}
