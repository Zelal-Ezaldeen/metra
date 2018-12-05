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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let name = usernameTxt.text, usernameTxt.text != "" else
        { return }
        guard let email = emailTxt.text, emailTxt.text != "" else
        { return }
       
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
    
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColo: self.avatarColor, completion: { (success) in
                            if success {
                              self.spinner.isHidden = true
                               self.spinner.startAnimating()
                                self.performSegue(withIdentifier: UNWIND , sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANDE, object: nil )
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
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
       let r = CGFloat(arc4random_uniform(255)) / 255
       let g = CGFloat(arc4random_uniform(255)) / 255
       let b = CGFloat(arc4random_uniform(255)) / 255

        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
             self.userImage.backgroundColor = self.bgColor
        }
    }
   
    func setUpView() {
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "اسم المستخدم", attributes: [NSAttributedString.Key.foregroundColor : metraPurplePlaceholder])
          emailTxt.attributedPlaceholder = NSAttributedString(string: "البريد الالكتروني", attributes: [NSAttributedString.Key.foregroundColor : metraPurplePlaceholder])
          passwordTxt.attributedPlaceholder = NSAttributedString(string: "كلمة المرور", attributes: [NSAttributedString.Key.foregroundColor : metraPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
