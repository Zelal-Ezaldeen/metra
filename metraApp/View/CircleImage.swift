//
//  CircleImage.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/4/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit
 @IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setUpView()
    }
  
  func  setUpView() {
    self.layer.cornerRadius = self.frame.width / 2
    self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }

}
