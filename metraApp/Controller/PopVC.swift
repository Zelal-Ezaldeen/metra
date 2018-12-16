//
//  PopVC.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/16/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit

class PopVC: UIViewController, UIGestureRecognizerDelegate{

    // Outlets
    @IBOutlet weak var popImageView: UIImageView!
    var passedImage: UIImage!
    
    
    
    func initData(forImage image: UIImage) {
        self.passedImage = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popImageView.image = passedImage
        addDoubleTap()

    }
    
    func addDoubleTap() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(screenWasDoubleTapped))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        view.addGestureRecognizer(doubleTap)
    }
    @objc func screenWasDoubleTapped() {
        dismiss(animated: true, completion: nil)
    }

}
