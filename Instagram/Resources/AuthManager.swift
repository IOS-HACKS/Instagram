//
//  AuthManager.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 01/12/20.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    public func registerNewUser(username:String, email:String, password:String,completion: @escaping ((Bool)->Void)){
        /*
         - check if username available
         - check email is available
         - create account
         - inser to database
         */
        
        DatabaseManager.shared.CanCreateNewUser(with: email, username: username){ canCreate in
            if canCreate {
                /*
                 - Create Account
                 - Insert Into Database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else{
                        // Firebase auth not inserted
                        completion(false)
                        return
                    }
                    // insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { (inserted) in
                        if inserted {
                            completion(true)
                            return
                        }
                        else{
                            // failed to insert to databse
                            completion(false)
                            return
                        }
                    }
                }
            }else{
                // email or password doesn't exist
                completion(false)
            }
        }
        
        
        
    }
    public func loginUser(username:String?,email:String?,password:String,completion:@escaping ((Bool) -> Void)){
        if let email = email {
            // email
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }else if let username = username{
            print(username)
        }
    }
}
