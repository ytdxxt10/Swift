//
//  UserTableViewCell.swift
//  UITableViewmvc
//
//  Created by Terry on 15/8/22.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var userImageView: UIImageView!
    
    
    @IBOutlet weak var userTelePhoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfigure(userInfo:UseModel) {
    println(userInfo.userName)
        
         self.userNameLabel?.text = userInfo.userName
        self.userTelePhoneLabel?.text = userInfo.telePhone
        self.userImageView?.image = UIImage(named: userInfo.imageString)

    }
    
}
