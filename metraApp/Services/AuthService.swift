//
//  AuthService.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 11/27/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get  {
        return defaults.value(forKey: TOKEN_KEY) as! String
    }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    
}

    var userEmail: String {
        get  {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
}
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
      
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
     
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let email  = json["user"] as? String {
                        self.userEmail = email
                        print(self.userEmail)
                    }
                    if let token = json["token"] as? String {
                        self.authToken = token
                    }

                }
                
//                guard let data = response.data else { return }
//                let json = try! JSON(data: data)
//                self.userEmail = json["user"].stringValue
//                self.authToken = json["token"].stringValue
//
                  self.isLoggedIn = true
            completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColo: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: String] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColo
            
        ]
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
            
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            if response.result.isSuccess {
              
                let json : JSON = JSON(response.result.value!)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                print("name is " + name)
                
                 UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
       
        }
       }
    }
    
   
    
    
}

