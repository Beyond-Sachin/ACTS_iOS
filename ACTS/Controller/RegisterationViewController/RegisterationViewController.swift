import UIKit
import MaterialComponents.MaterialTextFields
import Alamofire
import SwiftyJSON
import SQLite

class RegisterationViewController: UIViewController {
    
    var firstNametextField: MDCTextField!
    var lastNameTextField: MDCTextField!
    var emailTextField: MDCTextField!
    var countryTextField: MDCTextField!
    var firstContactTextField: MDCTextField!
    var secondContactTextField: MDCTextField!
    var addressTextField: MDCTextField!
    var cityTextField: MDCTextField!
    let ids = "UIDevice.current.identifirForVendor"
    var isNewUser = true
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldCardView: UIView!
    
    private var firstNameTextFieldControllerFloating: MDCTextInputControllerOutlined!
    private var lastNameTextFieldControllerFloating: MDCTextInputControllerOutlined!
    private var emailTextFieldControllerFloating: MDCTextInputControllerOutlined!
    private var countryTextFieldControllerFloating: MDCTextInputControllerOutlined!
    
    private var secondContactTextFieldControllerFloating: MDCTextInputControllerOutlined!
    private var firstContactTextFieldControllerFloating: MDCTextInputControllerOutlined!
    private var addressTextFieldControllerFloating: MDCTextInputControllerOutlined!
    private var cityTextFieldControllerFloating: MDCTextInputControllerOutlined!
    
    var threeId = ""
    
    @IBInspectable var placeHolder: String!
    @IBInspectable var value: String!
    @IBInspectable var primaryColor: UIColor! = .systemBlue
    lazy var textFieldWidth : CGFloat = 0.0
    lazy var textFieldHeight : CGFloat = 0.0
    var isUserRegistered = false
    
    @IBOutlet weak var myInfoLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var registerButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFieldProperty()
        self.threeId = UserDefault.getUniqueThreeId()
        hideKeyboardWhenTappedAround()
        fetchDataFromDatabase(threeId: threeId)
        setUsersData(threeId: threeId)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.removeFromSuperview()
    }
    func fetchDataFromDatabase(threeId: String){
        UserDataOperations.instance.getUserInfo(Table("userData")){ (userData) in
            self.isNewUser = false
            self.firstNametextField.text = userData["FirstName"] as? String
            self.lastNameTextField.text = userData["LastName"] as? String
            self.emailTextField.text = userData["Email"] as? String
            self.countryTextField.text = userData["Country"] as? String
            self.firstContactTextField.text = userData["Contact1"] as? String
            self.secondContactTextField.text = userData["Contact2"] as? String
            self.addressTextField.text = userData["Address"] as? String
            self.cityTextField.text = userData["City"] as? String
        }
    }
    
    func setUsersData(threeId :String) {
        isUserRegistered = UserDefault.isUserRegistered()
        print(isUserRegistered)
        if (isUserRegistered){
            configureNavigationBar(titleText: "My Info")
            welcomeLabel.text = "3IID: \(threeId)"
            registerButton.setTitle("UPDATE", for: .normal)
        }else {
            configureNavigationBar(titleText: "Registration")
            welcomeLabel.text = "Welcome"
            registerButton.setTitle("REGISTER", for: .normal)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func setUpTextFieldProperty() {
        //Change this properties to change the propperties of text
        textFieldWidth = self.view.bounds.size.width/1.110
        textFieldHeight = 100
        
        firstNametextField = MDCTextField(frame: CGRect(x: 10, y: 10, width: textFieldWidth, height: textFieldHeight))
        //        firstNametextField.frame = CGRect(x: 10, y: 10, width: textFieldWidth, height: textFieldHeight)
        
        firstNametextField.placeholder = "First Name (Optional)"
        firstNametextField.text = value
        
        firstNametextField.delegate = self
        //Change this properties to change the colors of border around text
        firstNameTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: firstNametextField)
        firstNameTextFieldControllerFloating.activeColor = primaryColor
        firstNameTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        firstNameTextFieldControllerFloating.normalColor = UIColor.lightGray
        firstNameTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        //        firstNametextField.center = self.textFieldCardView.center
        
        //Change this font to make borderRect bigger
        firstNameTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        firstNameTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        
        self.textFieldCardView?.addSubview(firstNametextField)
        //        firstNametextField.center.x = self.center.x
        //        firstNametextField.translatesAutoresizingMaskIntoConstraints = true
        
        //Change this properties to change the propperties of text
        lastNameTextField = MDCTextField(frame: CGRect(x: 10, y: 90, width: textFieldWidth, height: textFieldHeight))
        lastNameTextField.placeholder = "Last Name (Optional)"
        lastNameTextField.text = value
        lastNameTextField.delegate = self
        lastNameTextField.resignFirstResponder()
        //Change this properties to change the colors of border around text
        lastNameTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: lastNameTextField)
        
        lastNameTextFieldControllerFloating.activeColor = primaryColor
        lastNameTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        lastNameTextFieldControllerFloating.normalColor = UIColor.lightGray
        lastNameTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        
        //Change this font to make borderRect bigger
        lastNameTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        lastNameTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        self.textFieldCardView?.addSubview(lastNameTextField)
        //Change this properties to change the propperties of text
        emailTextField = MDCTextField(frame: CGRect(x: 10, y: 170, width: textFieldWidth, height: textFieldHeight))
        emailTextField.placeholder = "Email (Optional)"
        emailTextField.text = value
        emailTextField.delegate = self
        emailTextField.resignFirstResponder()
        //Change this properties to change the colors of border around text
        emailTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: emailTextField)
        
        emailTextFieldControllerFloating.activeColor = primaryColor
        emailTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        emailTextFieldControllerFloating.normalColor = UIColor.lightGray
        emailTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        
        //Change this font to make borderRect bigger
        emailTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        emailTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        self.textFieldCardView?.addSubview(emailTextField)
        
        //Change this properties to change the propperties of text
        countryTextField = MDCTextField(frame: CGRect(x: 10, y: 250, width: textFieldWidth, height: textFieldHeight))
        countryTextField.placeholder = "Country (Optional)"
        countryTextField.text = value
        countryTextField.delegate = self
        countryTextField.resignFirstResponder()
        //Change this properties to change the colors of border around text
        countryTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: countryTextField)
        
        countryTextFieldControllerFloating.activeColor = primaryColor
        countryTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        countryTextFieldControllerFloating.normalColor = UIColor.lightGray
        countryTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        
        //Change this font to make borderRect bigger
        countryTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        countryTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        self.textFieldCardView?.addSubview(countryTextField)
        
        //Change this properties to change the propperties of text
        firstContactTextField = MDCTextField(frame: CGRect(x: 10, y: 330, width: textFieldWidth, height: textFieldHeight))
        firstContactTextField.placeholder = "First Contact (Optional)"
        firstContactTextField.text = value
        firstContactTextField.delegate = self
        firstContactTextField.resignFirstResponder()
        //Change this properties to change the colors of border around text
        firstContactTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: firstContactTextField)
        
        firstContactTextFieldControllerFloating.activeColor = primaryColor
        firstContactTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        firstContactTextFieldControllerFloating.normalColor = UIColor.lightGray
        firstContactTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        
        //Change this font to make borderRect bigger
        firstContactTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        firstContactTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        self.textFieldCardView?.addSubview(firstContactTextField)
        
        //Change this properties to change the propperties of text
        secondContactTextField = MDCTextField(frame: CGRect(x: 10, y: 410, width: textFieldWidth, height: textFieldHeight))
        secondContactTextField.placeholder = "Second Contact (Optional)"
        secondContactTextField.text = value
        secondContactTextField.delegate = self
        secondContactTextField.resignFirstResponder()
        //Change this properties to change the colors of border around text
        secondContactTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: secondContactTextField)
        
        secondContactTextFieldControllerFloating.activeColor = primaryColor
        secondContactTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        secondContactTextFieldControllerFloating.normalColor = UIColor.lightGray
        secondContactTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        
        //Change this font to make borderRect bigger
        secondContactTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        secondContactTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        self.textFieldCardView?.addSubview(secondContactTextField)
        
        //Change this properties to change the propperties of text
        addressTextField = MDCTextField(frame: CGRect(x: 10, y: 490, width: textFieldWidth, height: textFieldHeight))
        addressTextField.placeholder = "Address (Optional)"
        addressTextField.text = value
        addressTextField.delegate = self
        addressTextField.resignFirstResponder()
        //Change this properties to change the colors of border around text
        addressTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: addressTextField)
        
        addressTextFieldControllerFloating.activeColor = primaryColor
        addressTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        addressTextFieldControllerFloating.normalColor = UIColor.lightGray
        addressTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        
        //Change this font to make borderRect bigger
        addressTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        addressTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        self.textFieldCardView?.addSubview(addressTextField)
        
        //Change this properties to change the propperties of text
        cityTextField = MDCTextField(frame: CGRect(x: 10, y: 570, width: textFieldWidth, height: textFieldHeight))
        cityTextField.placeholder = "City (Optional)"
        cityTextField.text = value
        cityTextField.delegate = self
        cityTextField.resignFirstResponder()
        //Change this properties to change the colors of border around text
        cityTextFieldControllerFloating = MDCTextInputControllerOutlined(textInput: cityTextField)
        
        cityTextFieldControllerFloating.activeColor = primaryColor
        cityTextFieldControllerFloating.floatingPlaceholderActiveColor = primaryColor
        cityTextFieldControllerFloating.normalColor = UIColor.lightGray
        cityTextFieldControllerFloating.inlinePlaceholderColor = UIColor.lightGray
        
        //Change this font to make borderRect bigger
        cityTextFieldControllerFloating.inlinePlaceholderFont = UIFont.systemFont(ofSize: 14)
        cityTextFieldControllerFloating.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        self.textFieldCardView?.addSubview(cityTextField)
    }
    
    @IBAction func registerButton_Pressed(_ sender: Any) {
        _ = "UIDevice.current.identifi"
        
        let parameter = [
            "Id": firstNametextField.text ?? "",
            "FirstName":firstNametextField.text ?? "",
            "LastName":lastNameTextField.text ?? "",
            "Email":emailTextField.text ?? "",
            "Country":countryTextField.text ?? "",
            "Contact1":firstContactTextField.text ?? "",
            "Contact2":secondContactTextField.text ?? "",
            "Address":addressTextField.text ?? "",
            "City":cityTextField.text ?? ""
            ] as [String : Any]
        //        print(parameter)
        if (!isNewUser) {
            ActsApi.sharedInstance.registerUserWithActs(parameter) { (response) in
                let registeredUser = RegisteredUserClass(response["userData"])
                if (registeredUser.Id != "" && registeredUser.Id != nil){
                    UserDefault.setUserRegistered(true)
                    if let id  = UserDataOperations.instance.addUserDataToDatabase(Id: registeredUser.Id ?? "",FirstName: registeredUser.FirstName ?? "",LastName: registeredUser.LastName ?? "",Email: registeredUser.Email ?? "",Country: registeredUser.Country ?? "",Contact1: registeredUser.Contact1 ?? "",Contact2: registeredUser.Contact2 ?? "",Address: registeredUser.Address ?? "",City: registeredUser.City ?? "") {
                        print(id)
                    }
                    if let threeId = registeredUser.Id{
                        UserDefault.setUniqueThreeId(threeId)
                    }
                    self.navigateToHomeViewScreen()
                }
            }
        }else {
            ActsApi.sharedInstance.updateRegisteredUserInfo(parameter as [String : Any],userId: threeId) { (userData) in
                let registeredUser = RegisteredUserClass(userData)
                if let id  = UserDataOperations.instance.updateUserInfoInDatabase(Id: registeredUser.Id ?? "",FirstName: registeredUser.FirstName ?? "",LastName: registeredUser.LastName ?? "",Email: registeredUser.Email ?? "",Country: registeredUser.Country ?? "",Contact1: registeredUser.Contact1 ?? "",Contact2: registeredUser.Contact2 ?? "",Address: registeredUser.Address ?? "",City: registeredUser.City ?? "") {
                    print(id)
                }
                if let threeId = registeredUser.Id{
                    UserDefault.setUniqueThreeId(threeId)
                }
                self.navigateToHomeViewScreen()
            }
        }
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}

extension RegisterationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension Collection where Iterator.Element == [String:AnyObject] {
    func toJSONString(options: JSONSerialization.WritingOptions = .prettyPrinted) -> String {
        if let arr = self as? [String:AnyObject],
            let dat = try? JSONSerialization.data(withJSONObject: arr, options: options),
            let str = String(data: dat, encoding: String.Encoding.utf8) {
            return str
        }
        return "[]"
    }
}
