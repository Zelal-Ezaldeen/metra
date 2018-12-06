//
//  AddChannelVC.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/6/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
// Outlets
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var chanDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
      
    }


    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text , nameTxt.text != "" else { return }
        guard let channelDesc = chanDesc.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    @IBAction func closeModelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "اسم المشروع", attributes: [NSAttributedString.Key.foregroundColor : metraPurplePlaceholder])
           chanDesc.attributedPlaceholder = NSAttributedString(string: "وصف المشروع", attributes: [NSAttributedString.Key.foregroundColor : metraPurplePlaceholder])
    }
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
