//
//  ChannelVC.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 11/25/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit



class ChannelVC: UIViewController {
//Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        

    }
    

  
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
