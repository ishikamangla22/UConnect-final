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
    
    override func layoutSubviews() {
            super.layoutSubviews()
        
        // Set corner radius
        interestImage.layer.cornerRadius = 15 // You can adjust the value as per your preference
        interestImage.clipsToBounds = true // Ensures the image stays within its bounds
        
        // Optionally, if you want to add a border
        interestImage.layer.borderWidth = 1.0 // Width of the border
        interestImage.layer.borderColor = UIColor.black.cgColor // Color of the border
            
            // Customize the label
//            interestName.textColor = .white
//            interestName.font = UIFont.boldSystemFont(ofSize: 17) // Adjust the font size as needed
        }

}
