//
//  UserDefaults.swift
//  ACTS
//
//  Created by Sachin Pandit on 02/10/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import Foundation

class UserDefault {
    class func isUserRegistered () -> Bool{
        return UserDefaults.standard.bool(forKey: "isUserRegistered")
    }
    class func setUserRegistered(_ isUserRegistered : Bool){
        UserDefaults.standard.set(isUserRegistered, forKey: "isUserRegistered")
        UserDefaults.standard.synchronize()
    }
    class func getUniqueThreeId () -> String{
        return UserDefaults.standard.string(forKey: "unique3Id") ?? ""
    }
    class func setUniqueThreeId (_ unique3Id : String){
        UserDefaults.standard.set(unique3Id, forKey: "unique3Id")
        UserDefaults.standard.synchronize()
    }
}
