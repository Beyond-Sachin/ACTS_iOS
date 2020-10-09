//
//  SettingsViewController.swift
//  ACTS
//
//  Created by Appstute-Sachin on 9/24/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import UIKit
//import TinyConstraints


class SettingsViewController: UIViewController {
    
    @IBOutlet var dayNightToggleSwitch : UISwitch!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var categorySwitch:UISwitch!
    var androidSwitchSmall: MaterialToggleSwitch!
    var m = MaterialToggleSwitch()
    
    lazy var themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.tintColor = #colorLiteral(red: 0.9411764706, green: 0.1882352941, blue: 0.1882352941, alpha: 1)
        themeSwitch.onTintColor = #colorLiteral(red: 0.9411764706, green: 0.1882352941, blue: 0.1882352941, alpha: 1)
        themeSwitch.thumbTintColor = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
        themeSwitch.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        themeSwitch.layer.cornerRadius = 16
        themeSwitch.layer.masksToBounds = true
        themeSwitch.addTarget(self, action: #selector(didChangeThemeSwitchValue), for: .valueChanged)
        return themeSwitch
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(titleText: "Settings")
    }

    @objc func disconnectPaxiSocket(_ notification: Notification) {
        
    }
    @objc func didChangeThemeSwitchValue() {
        if themeSwitch.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    func navigationBarConfigure(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .blue
        self.navigationItem.leftItemsSupplementBackButton = true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
