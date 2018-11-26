//
//  CreateAccountVC.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 11/26/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closePressed(_ sender: Any) {
    performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
