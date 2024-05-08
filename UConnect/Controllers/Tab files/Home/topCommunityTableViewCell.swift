//
//  topCommunityTableViewCell.swift
//  UConnect
//
//  Created by Sharanpreet Singh  on 26/04/24.
//

import UIKit

class topCommunityTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var communityNameLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    

    
    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        profileImage.layer.cornerRadius = 35
//        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 40, height: 40))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        mask.fillColor = UIColor.white.cgColor
//        profileImage.layer.mask = mask
        super.awakeFromNib()
            // Initialization code
            profileImage.layer.cornerRadius = profileImage.frame.width / 2
            profileImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

