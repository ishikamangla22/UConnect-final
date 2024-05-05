//
//  NotificationTableViewCell.swift
//  UConnect
//
//  Created by student on 04/05/24.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var communityProfileImage: UIImageView!
    @IBOutlet weak var communityName: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
