//
//  ProfileTableViewCell.swift
//  UConnect
//
//  Created by Student on 07/05/24.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var communitiesCount: UILabel!
    @IBOutlet weak var postsCount: UILabel!
    @IBOutlet weak var branchName: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
