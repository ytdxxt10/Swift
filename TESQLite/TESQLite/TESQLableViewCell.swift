//
//  TESQLableViewCell.swift
//  TESQLite
//
//  Created by offcn on 15/8/26.
//  Copyright (c) 2015年 Terry. All rights reserved.
//

import UIKit

class TESQLableViewCell: UITableViewCell {

    @IBOutlet weak var TEImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
