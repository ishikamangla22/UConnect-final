//
//  communityRequestTableViewCell.swift
//  UConnect
//
//  Created by student on 03/05/24.
//

import UIKit

class communityRequestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var communityProfileImageName: UIImageView!
    @IBOutlet weak var communityName: UILabel!
    @IBOutlet weak var requestStatus: UILabel!
    
    



    override func layoutSubviews() {
        super.layoutSubviews()
        
        communityProfileImageName.layer.cornerRadius = communityProfileImageName.frame.width/2
        communityProfileImageName.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
