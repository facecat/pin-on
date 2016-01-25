//
//  PostCell.swift
//  pin-on
//
//  Created by 邱国邦 on 16/1/25.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var postTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func drawRect(rect: CGRect) {
        userImg.layer.cornerRadius = userImg.frame.size.width / 2
        userImg.clipsToBounds = true
        
    }

//    func configurePostCell(post: poPost) {
//        nameLbl.text = post.userName
//        
//    }
}
