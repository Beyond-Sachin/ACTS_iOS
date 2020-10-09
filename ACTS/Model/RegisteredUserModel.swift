//
//  RegisteredUserModel.swift
//  ACTS
//
//  Created by Sachin Pandit on 02/10/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import Foundation
import SwiftyJSON

class RegisteredUserClass {
    
    let Address: String?
    let City: String?
    let Contact1: String?
    let Contact2: String?
    let Country: String?
    let Email: String?
    let FirstName: String?
    let Id: String?
    let LastName: String?
//    init(_ address: String,city: String,contact1: String,contact2: String,country: String,email: String,firstName: String,id: String,lastName: String) {
//        Address = address
//        City = city
//        Contact1 = contact1
//        Contact2 = contact2
//        Country = country
//        Email = email
//        FirstName = firstName
//        Id = id
//        LastName = lastName
//    }
    
    init(_ json: JSON) {
        Address = json["Address"].stringValue
        City = json["City"].stringValue
        Contact1 = json["Contact1"].stringValue
        Contact2 = json["Contact2"].stringValue
        Country = json["Country"].stringValue
        Email = json["Email"].stringValue
        FirstName = json["FirstName"].stringValue
        Id = json["Id"].stringValue
        LastName = json["LastName"].stringValue
    }
}
