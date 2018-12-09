//
//  MessageCell.swift
//  metraApp
//
//  Created by Zelal-Ezaldeen on 12/9/18.
//  Copyright © 2018 Metra Company. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
// Outlets
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(message: Message) {
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }

}
