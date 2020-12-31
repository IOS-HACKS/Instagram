//
//  DatabaseManager.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 01/12/20.
//

import Foundation
import FirebaseDatabase


public class DatabaseManager {

    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    // check username and email available
    public func CanCreateNewUser(with email:String, username:String, completion:(Bool)->Void){
        completion(true)
    }
    
    // insert new data into database
    // - means we are not using that parameter
    public func insertNewUser(with email:String, username:String, completion:@escaping (Bool)->Void){
        var key = email.safeDatabaseKey()
        database.child(key).setValue(["username":username]){ error,_ in
            if error == nil {
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }
    }
    
}
