//
//  CreateAccountVC.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 11/26/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit


class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
       
      
        guard let name = usernameTxt.text, usernameTxt.text != "" else
        { return }
        guard let email = emailTxt.text, emailTxt.text != "" else
        { return }
       
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
    
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                      //  print("LOGGED in USER", AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColo: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
                 
            }
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
    performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
}
