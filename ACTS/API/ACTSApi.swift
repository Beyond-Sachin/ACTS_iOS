import Foundation
import Alamofire
import SwiftyJSON

private let SharedInstance = ActsApi()

class ActsApi: NSObject {
    
    fileprivate var accessToken:String?
    
    class var sharedInstance : ActsApi {
        return SharedInstance
    }
    private let baseUrl = "http://52.237.119.123:8070/"
    
    func registerUserWithActs(_ parameters:[String:Any],completionHandler:@escaping (_ invitableUsers:JSON) -> Void) {
        let header: HTTPHeaders  = [ "Content-Type" :  "application/json" ]
        AF.request(baseUrl+"registration", method:.post, parameters: parameters,encoding: JSONEncoding.default,headers: header).responseJSON(completionHandler: { (response) in
            print(response)
            switch response.result{
            case.success(let data):
                let response = JSON(data)
                print(response["errorCode"])
                if (response["errorCode"] == "null"){
                    completionHandler(response)
                }else{
                    AF.request(self.baseUrl+"users/Arnav", method:.get,encoding: JSONEncoding.default,headers: header).responseJSON(completionHandler: { (response) in
                        print(response)
                        switch response.result{
                        case.success(let data):
                            let response = JSON(data)
                             completionHandler(response)
                        case .failure( _): break
                        }
                    })
                }
            case .failure( _): break
            }
        })
    }
    func updateRegisteredUserInfo(_ parameters:[String:Any],userId : String,completionHandler:@escaping (_ invitableUsers:JSON) -> Void) {
        let header: HTTPHeaders  = [ "Content-Type" :  "application/json" ]
        AF.request(baseUrl+"users/\(userId)", method:.put, parameters: parameters,encoding: JSONEncoding.default,headers: header).responseJSON(completionHandler: { (response) in
            print(response)
            switch response.result{
            case.success(let data):
                let responses = JSON(data)
                print(responses)
                completionHandler(responses["userData"])
            case .failure( _): break
            }
        })
    }
}
