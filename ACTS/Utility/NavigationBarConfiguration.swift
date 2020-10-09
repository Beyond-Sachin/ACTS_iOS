import UIKit

extension UIViewController {
    
    func configureNavigationBar(titleText :String) {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = titleText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = titleLabel
        let menuLeftPadding = 80
        guard let containerView = self.navigationItem.titleView?.superview else { return }
        let leftBarItemWidth = self.navigationItem.leftBarButtonItems?.reduce(0, { $0 + $1.width })
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor,
                                             constant: (leftBarItemWidth ?? 0) + CGFloat(menuLeftPadding)),
            
            
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ])
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .systemBlue
    }
    func navigateToHealthDeclarationScreen(){
        let navigation = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HealthDeclarationViewController") as! UINavigationController
        
        sideMenuController?.setContentViewController(to: navigation, animated: false, completion: nil)
    }
    func navigateToReportInfectionViewScreen(isFromFromReportInfection : Bool){
        let navigation = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReportInfectionView") as! UINavigationController
        let vc = navigation.viewControllers.first as! ReportInfectionViewController
        vc.isFromFromReportInfection = isFromFromReportInfection
        sideMenuController?.setContentViewController(to: navigation, animated: false, completion: nil)
    }
    func navigateToHomeViewScreen(){
        //        let navigation = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContentNavigation") as! UINavigationController
        //        let id = sideMenuController?.currentCacheIdentifier() ?? "1"
        ////        print(id)
        //        sideMenuController?.clearCache(with: id)
        //        sideMenuController?.setContentViewController(to: navigation, animated: false, completion: nil)
        let sideMenuController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenu")
        UIApplication.shared.keyWindow?.rootViewController = sideMenuController
        
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

