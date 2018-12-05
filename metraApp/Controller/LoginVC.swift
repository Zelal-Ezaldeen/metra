//
//  LoginVCViewController.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 11/26/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

       
    }
  
    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let pass = passwordTxt.text, passwordTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANDE, object: nil  )
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                        
                    }
                })
            }
        }

    }
    
    @IBAction func clodePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
 
    func setUpView() {
         spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "اسم المستخدم", attributes: [NSAttributedString.Key.foregroundColor : metraPurplePlaceholder])
     
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "كلمة المرور", attributes: [NSAttributedString.Key.foregroundColor : metraPurplePlaceholder])
        
    }
}
