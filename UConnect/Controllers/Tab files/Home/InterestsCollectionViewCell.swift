//
//  InterestsCollectionViewCell.swift
//  UConnect
//
//  Created by student on 02/05/24.
//

import UIKit

class InterestsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var interestName: UILabel!
    
    @IBOutlet weak var interestImage: UIImageView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Customize the label
            interestName.textColor = .white
            interestName.font = UIFont.boldSystemFont(ofSize: 17) // Adjust the font size as needed
        }

}
