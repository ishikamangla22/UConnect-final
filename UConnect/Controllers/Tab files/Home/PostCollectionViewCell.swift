import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var communityProfileImage: UIImageView!
    @IBOutlet weak var communityName: UILabel!
    @IBOutlet weak var sharedBy: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var likes: UILabel!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set corner radius
//        communityProfileImage.layer.cornerRadius = 15 // You can adjust the value as per your preference
//        communityProfileImage.clipsToBounds = true // Ensures the image stays within its bounds
//        
//        // Optionally, if you want to add a border
//        communityProfileImage.layer.borderWidth = 1.0 // Width of the border
//        communityProfileImage.layer.borderColor = UIColor.black.cgColor // Color of the border
    }
}
