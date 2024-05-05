////
////  PopDancersPageViewController.swift
////  UConnect
////
////  Created by student on 05/05/24.
////
//
//import UIKit
//
//class PopDancersPageViewController: UIViewController {
//
//    @IBOutlet weak var coolerLabel: UILabel!
//    
//    @IBOutlet weak var memberButton: UIButton!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Set initial text color based on interface style
//        updateLabelColor()
//                
//        // Register for trait collection changes to handle dynamic changes between light and dark mode
//        NotificationCenter.default.addObserver(self, selector: #selector(traitCollectionDidChange(_:)), name: UIApplication.didChangeStatusBarFrameNotification, object: nil)
//                
//        // Set corner radius for the button
//        memberButton.layer.cornerRadius = 15
//        memberButton.clipsToBounds = true
//        
////        // Check the current interface style
////                if traitCollection.userInterfaceStyle == .dark {
////                    // Set text color to white for dark mode
////                    coolerLabel.textColor = .white
////                } else {
////                    // Set text color to black for light mode
////                    coolerLabel.textColor = .black
////                }
////                
////                // Register for trait collection changes to handle dynamic changes between light and dark mode
////                NotificationCenter.default.addObserver(self, selector: #selector(traitCollectionDidChange(_:)), name: UIApplication.didChangeStatusBarFrameNotification, object: nil)
////
////        // Do any additional setup after loading the view.
////        
////        //set corner radius
////        
////        memberButton.layer.cornerRadius = 15
////        memberButton.clipsToBounds = true
//    }
//    
//   override @objc func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//            // Handle trait collection changes, such as transitioning between light and dark mode
//            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
//                // Update text color based on the new interface style
//                if traitCollection.userInterfaceStyle == .dark {
//                    coolerLabel.textColor = .white
//                } else {
//                    coolerLabel.textColor = .black
//                }
//            }
//        }
//    
//
// 
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}


import UIKit

class PopDancersPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var coolerLabel: UILabel!
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var postsCollectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        
        // Set initial text color based on interface style
        updateLabelColor()
        
        // Register for trait collection changes to handle dynamic changes between light and dark mode
        NotificationCenter.default.addObserver(self, selector: #selector(traitCollectionDidChange(_:)), name: UIApplication.didChangeStatusBarFrameNotification, object: nil)
        
        // Set corner radius for the button
        memberButton.layer.cornerRadius = 15
        memberButton.clipsToBounds = true
        
        // Add target for button tap action
        memberButton.addTarget(self, action: #selector(memberButtonTapped(_:)), for: .touchUpInside)
        
        postsCollectionView.setCollectionViewLayout(generateLayout3(), animated: true)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Update text color when trait collection changes
        updateLabelColor()
    }
    
    func updateLabelColor() {
        // Update text color based on interface style
        coolerLabel.textColor = traitCollection.userInterfaceStyle == .dark ? .white : .black
    }
    
    // MARK: - Button Action
    
    @objc func memberButtonTapped(_ sender: UIButton) {
        // Handle button tap action here
        print("Member button tapped!")
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popDancersposts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popDancersPost" , for: indexPath) as! PopDancersPostCollectionViewCell
        
        let post = popDancersposts[indexPath.item]
        
        let imagePost = UIImage(named: post.post)
        
        cell.popDancersPostImage.image = imagePost
        
        return cell
        
    }
    
    func generateLayout3() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5), // Two items in a row, so 0.5 for each item
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5) // Adjust insets as needed
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100) // Adjust the height of the group if needed
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3) // Two items in a row
//        group.interItemSpacing = .fixed(10) // Adjust spacing between items
        
        let section = NSCollectionLayoutSection(group: group)
//        section.interGroupSpacing = 10 // Adjust spacing between groups
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
    
    
    
}
