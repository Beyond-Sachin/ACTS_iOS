//
//  SQLiteOperations.swift
//  ACTS
//
//  Created by Sachin Pandit on 05/10/20.
//  Copyright © 2020 hayysoft. All rights reserved.
//

import SQLite
import SwiftyJSON

class UserDataOperations {
    static let instance = UserDataOperations()
    private var db: Connection? = nil
    
    private let userData = Table("userData")
    private let id = Expression<String>("Id")
    private let firstName = Expression<String>("FirstName")
    private let lastName = Expression<String?>("LastName")
    private let email = Expression<String>("Email")
    private let country = Expression<String>("Country")
    private let contact1 = Expression<String>("Contact1")
    private let contact2 = Expression<String>("Contact2")
    private let address = Expression<String?>("Address")
    private let city = Expression<String>("City")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        do {
            db = try Connection("\(path)/Stephencelis.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        createDatabase()
    }
    
    func createDatabase() {
        do {
            try db!.run(userData.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(firstName)
                table.column(lastName)
                table.column(email)
                table.column(country)
                table.column(contact1)
                table.column(contact2)
                table.column(address)
                table.column(city)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addUserDataToDatabase(Id: String, FirstName: String, LastName: String,Email: String, Country: String, Contact1: String,Contact2: String,Address: String,City: String) -> Int64? {
        do {
            let insert = userData.insert(id <- Id, firstName <- FirstName, lastName <- LastName,email <- Email,country <- Country,contact1 <- Contact1,contact2 <- Contact2,address <- Address,city <- City)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    func updateUserInfoInDatabase(Id: String, FirstName: String, LastName: String,Email: String, Country: String, Contact1: String,Contact2: String,Address: String,City: String) -> Bool? {
        let contact = userData.filter(id == Id)
        do {
            let update = contact.update([
                id <- Id, firstName <- FirstName, lastName <- LastName,email <- Email,country <- Country,contact1 <- Contact1,contact2 <- Contact2,address <- Address,city <- City
                ])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }

        return false
    }
    func getUserInfo(_ parameters:Any,completionHandler:@escaping (_ invitableUsers:[String: Any]) -> Void) {
      do {
            for user in try db!.prepare(userData) {
                print("id: \(user[id]), name: \(user[firstName]), email: \(user[email])")
                // id: 1, name: Optional("Alice"), email: alice@mac.com
                
                let parameter = [
                    "FirstName":user[firstName],
                    "LastName":user[lastName],
                    "Email":user[email],
                    "Country": user[country],
                    "Contact1": user[contact1],
                    "Contact2":user[contact2],
                    "Address": user[address],
                    "City": user[city]
                ]
                completionHandler(parameter as [String : Any])
                
            }
        } catch {
            print("Select failed")
        }
    }
}
