//
//  SiriForMetra.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/17/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit
import Intents

class SiriForMetra: UIViewController {
 // Outlets
    
    @IBOutlet weak var typeServiceLbl: UILabel!
    @IBOutlet weak var budgetLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeServiceLbl.isHidden = true
        budgetLbl.isHidden = true
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized {
                print("Siri")
            } else {
                print("UN AU")
            }
    }
   
    }
}
