//
//  LiveTableViewCell.swift
//  KTHeartFlyView
//
//  Created by KT on 2017/9/28.
//  Copyright © 2017年 KEENTEAM. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var bigImgView: UIImageView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var viewersNumLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImgView.layer.cornerRadius = iconImgView.frame.width/2
        iconImgView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
