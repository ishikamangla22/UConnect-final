//
//  CommunityTableViewCell.swift
//  UConnect
//
//  Created by Student on 09/05/24.
//

import UIKit

class CommunityTableViewCell: UITableViewCell {

    @IBOutlet weak var communityImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
