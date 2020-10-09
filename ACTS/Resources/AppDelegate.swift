import UIKit
import SideMenuSwift
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isFromFromReportInfectionScreen = false
    var items: [(String, Int)] = []

    var isFirstButtonPressed = false
    var isSecondButtonPressed = false
    var isUserRegistered = false

    class func sharedInstance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       isUserRegistered = UserDefault.isUserRegistered()
        configureSideMenu()
        IQKeyboardManager.shared.enable = true
        return true
    }

    private func configureSideMenu() {
        SideMenuController.preferences.basic.menuWidth = 280
        SideMenuController.preferences.basic.defaultCacheKey = "0"
    }

}

#if DEBUG
extension AppDelegate {
    private func setupTestingEnvironment(with arguments: [String]) {
        if arguments.contains("SwitchToRight") {
            SideMenuController.preferences.basic.direction = .right
        }
    }
}
#endif
