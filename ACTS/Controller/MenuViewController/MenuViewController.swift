//
//  MenuViewController.swift
//  SideMenuExample
//
//  Created by kukushi on 11/02/2018.
//  Copyright © 2018 kukushi. All rights reserved.
//

import UIKit
import SideMenuSwift

class Preferences {
    static let shared = Preferences()
    var enableTransitionAnimation = false
}

class MenuViewController: UIViewController {
    var isDarkModeEnabled = false
    var menuItemsArray : [String] = []
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var isUserRegistered =  false
    @IBOutlet weak var selectionTableViewHeader: UILabel!
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var selectionMenuTrailingConstraint: NSLayoutConstraint!
    private var themeColor = UIColor.white
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMenuItems()
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isDarkModeEnabled = SideMenuController.preferences.basic.position == .under
        configureView()
        sideMenuController?.delegate = self
        
    }
    
    // Display menu items in side menu bar
    func getMenuItems(){
        AppDelegate.sharedInstance().isUserRegistered = UserDefault.isUserRegistered()
        print(AppDelegate.sharedInstance().isUserRegistered)
        if (!AppDelegate.sharedInstance().isUserRegistered){
            menuItemsArray = ["Home","Registration","FAQs"]
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController")
            }, with: "1")
            
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "FAQsViewController")
            }, with: "2")
        }else{
            menuItemsArray = ["Home","My Info","Health Declaration","My Risk","Contact History","FAQs","Settings"]
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController")
            }, with: "1")
            
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "HealthDeclarationViewController")
            }, with: "2")
            
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "MyRiskViewController")
            }, with: "3")
            
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ContactHistoryViewController")
            }, with: "4")
            
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "FAQsViewController")
            }, with: "5")
            
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
            }, with: "6")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[Example] Menu did appear")
    }
    
    private func configureView() {
        if isDarkModeEnabled {
            themeColor = UIColor(red: 0.03, green: 0.04, blue: 0.07, alpha: 1.00)
            selectionTableViewHeader.textColor = .white
        } else {
            selectionMenuTrailingConstraint.constant = 0
            themeColor = UIColor(red: 0.98, green: 0.97, blue: 0.96, alpha: 1.00)
        }
        
        let sidemenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sidemenuBasicConfiguration.position == .under) != (sidemenuBasicConfiguration.direction == .right)
        if showPlaceTableOnLeft {
            selectionMenuTrailingConstraint.constant = SideMenuController.preferences.basic.menuWidth - view.frame.width
        }
        
        view.backgroundColor = themeColor
        tableView.backgroundColor = themeColor
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let sideMenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sideMenuBasicConfiguration.position == .under) != (sideMenuBasicConfiguration.direction == .right)
        selectionMenuTrailingConstraint.constant = showPlaceTableOnLeft ? SideMenuController.preferences.basic.menuWidth - size.width : 0
        view.layoutIfNeeded()
    }
}

extension MenuViewController: SideMenuControllerDelegate {
    func sideMenuController(_ sideMenuController: SideMenuController,
                            animationControllerFrom fromVC: UIViewController,
                            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BasicTransitionAnimator(options: .transitionFlipFromLeft, duration: 0.6)
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller will show [\(viewController)]")
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller did show [\(viewController)]")
    }
    
    func sideMenuControllerWillHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will hide")
    }
    
    func sideMenuControllerDidHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did hide.")
    }
    
    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will reveal.")
    }
    
    func sideMenuControllerDidRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did reveal.")
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectionCell
        cell.contentView.backgroundColor = themeColor
        cell.titleLabel?.text = menuItemsArray[indexPath.row]
        cell.titleLabel?.textColor = isDarkModeEnabled ? .white : .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        sideMenuController?.setContentViewController(with: "\(row)", animated: Preferences.shared.enableTransitionAnimation)
        sideMenuController?.hideMenu()
        
        if let identifier = sideMenuController?.currentCacheIdentifier() {
            print("[Example] View Controller Cache Identifier: \(identifier)")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

class SelectionCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}
