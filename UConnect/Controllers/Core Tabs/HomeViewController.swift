
  

//
//  HomeViewController.swift
//  UConnect
//
//  Created by student on 22/04/24.
//

import FirebaseAuth
import UIKit

//class HomeViewController: UIViewController {
//    
//    var stackView: UIStackView!
//    var headingLabel: UILabel!
////    var segmentedControl: UISegmentedControl!
//    var addButton: UIButton! // Declare addButton at the class level
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        
//        setupStackView()
//        // Initially select the first segment
////        segmentedControl.selectedSegmentIndex = 0
//        
//        // Call a method to set up the "+" button
//        setupAddButton()
//    }
//    
//    func setupStackView() {
//        // Initialize the stack view
//        stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//        stackView.spacing = 20
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        // Add stack view to the view
//        view.addSubview(stackView)
//        
//        // Set constraints for the stack view
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//        
//        // Call a method to set up the heading label
//        setupHeadingLabel()
//        
//        // Call a method to set up the segmented control
////        setupSegmentedControl()
//        
//        // Add heading label and segmented control to the stack view
//        stackView.addArrangedSubview(headingLabel)
////        stackView.addArrangedSubview(segmentedControl)
//        
//    }
//    
//    
//    func setupHeadingLabel() {
//        // Initialize the heading label
//        headingLabel = UILabel()
//        headingLabel.text = "Communities"
//        headingLabel.textAlignment = .left
//        headingLabel.font = UIFont.boldSystemFont(ofSize: 24)
//        headingLabel.numberOfLines = 1
//    }
//    
////    func setupSegmentedControl() {
////        // Initialize segmented control with three segments
////        segmentedControl = UISegmentedControl(items: ["Joined", "Find", "About"])
////        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
////    }
//    
////    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
////        // Handle value changes here
////        let selectedIndex = sender.selectedSegmentIndex
////        print("Selected segment: \(selectedIndex), Title: \(sender.titleForSegment(at: selectedIndex) ?? "")")
////        
////        // Perform actions based on selected segment index
////        switch selectedIndex {
////        case 0:
////            // Perform actions for the first segment
////            print("Joined")
////            break
////        case 1:
////            // Perform actions for the second segment
////            print("Find")
////            break
////        case 2:
////            // Perform actions for the third segment
////            print("About")
////            break
////        default:
////            break
////        }
////    }
////    
//    func setupAddButton() {
//        // Initialize the add button
//        addButton = UIButton(type: .custom)
//        addButton.tintColor = .blue // Set the tint color to blue
//        addButton.setImage(UIImage(systemName: "plus"), for: .normal) // Use SF Symbols "plus" icon
//        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
//        
//        // Add add button to the stack view
//        stackView.addArrangedSubview(addButton)
//        addButton.isHidden = true // Initially hide the add button
//    }
//    
//    @objc func addButtonTapped(_ sender: UIButton) {
//        // Handle button tap here
//        print("Add button tapped")
//        
//        // You can perform actions like adding a new item, presenting a new view controller, etc.
//    }
//    
//    
//    //    override func viewDidAppear(_ animated: Bool) {
//    //        super.viewDidAppear(animated)
//    //
//    //    }
//    
//    private func handleNotAuthenticated() {
//        // Check auth status
//        if Auth.auth().currentUser == nil {
//            // Show log in
//            let loginVC = LogInFromVideoViewController()
//            loginVC.modalPresentationStyle = .fullScreen
//            present(loginVC, animated: false)
//        }
//    }
//    
//    
//}
//

//private let reuseIdentifier = "Cell"
//
//class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    @IBOutlet weak var segmentedController: UISegmentedControl!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Communities"
//        
//        outerCollectionView.delegate = self
//        outerCollectionView.dataSource = self
//        
//        secondCollectionView.delegate = self
//        secondCollectionView.dataSource = self
//
//        
//    }
//    
//    @IBAction func didTapNewNote() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Assuming "Main" is your storyboard name
//        if let addViewController = storyboard.instantiateViewController(withIdentifier: "AddPostViewControllerIdentifier") as? AddPostViewController {
//            // Optionally, configure properties of the AddViewController here
//            
//            // Push the AddViewController onto the navigation stack
//            navigationController?.pushViewController(AddPostViewController, animated: true)
//        }
//    }
//    
//    @IBOutlet weak var outerCollectionView: UICollectionView!
//    
//    @IBOutlet weak var secondCollectionView: UICollectionView!
//    
//    
//    private func handleNotAuthenticated() {
//            // Check auth status
//            if Auth.auth().currentUser == nil {
//                // Show log in
//                let loginVC = LogInFromVideoViewController()
//                loginVC.modalPresentationStyle = .fullScreen
//                present(loginVC, animated: false)
//            }
//        }
////
//    
//    @IBAction func segmentedController(_ sender: UISegmentedControl) {
//        
//        switch sender.selectedSegmentIndex {
//            
//        case 0:
//            secondCollectionView.isHidden = true
//            outerCollectionView.isHidden = false
//
//            outerCollectionView.setCollectionViewLayout(generateLayout1(), animated: true)
//            
//            
//            // Collection View Code
//            
//            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//                return Posts.count
//            }
//            
//            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! PostCollectionViewCell
//                
//                let post = Posts[indexPath.item]
//                
//                cell.communityName.text = post.communityName
//                cell.sharedBy.text = post.sharedBy
//                cell.postDescription.text = post.postDescription
//                
//                let imageCommunity = UIImage(named: post.communityProfileImageName)
//                let imagePost = UIImage(named: post.postImageName)
//                
//                cell.communityProfileImage.image = imageCommunity
//                cell.postImage.image = imagePost
//            
//                // Configure the cell
//            
//                return cell
//            }
//            
//            func generateLayout1() -> UICollectionViewLayout {
//                
//                let itemSize = NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0)
//                )
//                
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                
//                let spacing: CGFloat = 10
//                
//                let groupSize = NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(0.5)
//                )
//                
//                let group = NSCollectionLayoutGroup.horizontal(
//                    layoutSize: groupSize,
//                    repeatingSubitem: item,
//                    count: 1
//                )
//                
//                group.contentInsets = NSDirectionalEdgeInsets(
//                    top: spacing,
//                    leading: spacing,
//                    bottom: 0,
//                    trailing: spacing
//                )
//                
//                let section = NSCollectionLayoutSection(group: group)
//                
//                let layout = UICollectionViewCompositionalLayout(section: section)
//                
//                return layout
//                
//            }
//            
//            break
//            
//        case 1:
//            outerCollectionView.isHidden = true
//            secondCollectionView.isHidden = false
//            
//            secondCollectionView.setCollectionViewLayout(generateLayout2(), animated: true)
//            
//            // Collection View Code here
//            
//            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//                return Interests.count
//            }
//            
//            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! InterestsCollectionViewCell
//                
//                cell.interestName.text = Interests[indexPath.item]
//                cell.interestImage.image = interestsImage[indexPath.item]
//                // Configure the cell
//            
//                return cell
//            }
//            
//            func generateLayout2() -> UICollectionViewLayout {
//                
//                let itemSize = NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0)
//                )
//                
//                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                
//                let spacing: CGFloat = 10
//                
//                let groupSize = NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .absolute(70.0)
//                )
//                
//                let group = NSCollectionLayoutGroup.horizontal(
//                    layoutSize: groupSize,
//                    repeatingSubitem: item,
//                    count: 1
//                )
//                
//                group.contentInsets = NSDirectionalEdgeInsets(
//                    top: spacing,
//                    leading: spacing,
//                    bottom: 0,
//                    trailing: spacing
//                )
//                
//                let section = NSCollectionLayoutSection(group: group)
//                
//                let layout = UICollectionViewCompositionalLayout(section: section)
//                
//                return layout
//                
//            }
//
//            break
//        case 2:
//            outerCollectionView.isHidden = true
//            secondCollectionView.isHidden = true
//            break
//        default:
//            break
//        }
//    }
//    
//    
//    
//}


// Create a SwiftUI view
//            let postlistView = PostCard()
//
//            // Wrap the SwiftUI view in a UIHostingController
//            let hostingController = UIHostingController(rootView: postlistView)
//
//            // Add the hosting controller's view as a subview
//            addChild(hostingController)
//            view.addSubview(hostingController.view)
//            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//            hostingController.didMove(toParent: self)
private let reuseIdentifier = "Cell"

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var outerCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Communities"
        
        outerCollectionView.delegate = self
        outerCollectionView.dataSource = self
        
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        
        handleNotAuthenticated()
    }
    
    @IBAction func didTapNewNote() {
        let addViewController = AddPostViewController()
        navigationController?.pushViewController(addViewController, animated: true)
    }
    
    private func handleNotAuthenticated() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show log in
            let loginVC = LogInFromVideoViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            secondCollectionView.isHidden = true
            outerCollectionView.isHidden = false
            outerCollectionView.setCollectionViewLayout(generateLayout1(), animated: true)
        case 1:
            outerCollectionView.isHidden = true
            secondCollectionView.isHidden = false
            secondCollectionView.setCollectionViewLayout(generateLayout2(), animated: true)
        case 2:
            outerCollectionView.isHidden = true
            secondCollectionView.isHidden = true
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == outerCollectionView {
            return Posts.count
        } else if collectionView == secondCollectionView {
            return Interests.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == outerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! PostCollectionViewCell
             
             let post = Posts[indexPath.item]
             
             cell.communityName.text = post.communityName
             cell.sharedBy.text = post.sharedBy
             cell.postDescription.text = post.postDescription
             
             let imageCommunity = UIImage(named: post.communityProfileImageName)
             let imagePost = UIImage(named: post.postImageName)
             
             cell.communityProfileImage.image = imageCommunity
             cell.postImage.image = imagePost
         
             // Configure the cell
         
             return cell
        } else if collectionView == secondCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell" , for: indexPath) as! InterestsCollectionViewCell
             
             cell.interestName.text = Interests[indexPath.item]
             cell.interestImage.image = interestsImage[indexPath.item]
             // Configure the cell
         
             return cell
        }
        fatalError("Unexpected collection view")
    }
    
    func generateLayout1() -> UICollectionViewLayout {
        // Layout configuration for the first collection view
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let spacing: CGFloat = 10
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        
        group.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: 0,
            trailing: spacing
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
    
    func generateLayout2() -> UICollectionViewLayout {
        // Layout configuration for the second collection view
        
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(0.4),
//            heightDimension: .fractionalHeight(0.5)
//        )
//        
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let spacing: CGFloat = 10
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(0.6)
//        )
//        
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: groupSize,
//            repeatingSubitem: item,
//            count: 2
//        )
//        
//        group.interItemSpacing = .fixed(10) // Adjust spacing between items
//
//        
////        group.contentInsets = NSDirectionalEdgeInsets(
////            top: spacing,
////            leading: spacing,
////            bottom: 0,
////            trailing: spacing
////        )
//        
//        let section = NSCollectionLayoutSection(group: group)
//        
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        
//        return layout
        
        let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5), // Two items in a row, so 0.5 for each item
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5) // Adjust insets as needed
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(100) // Adjust the height of the group if needed
            )
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2) // Two items in a row
            group.interItemSpacing = .fixed(10) // Adjust spacing between items
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10 // Adjust spacing between groups
            
            let layout = UICollectionViewCompositionalLayout(section: section)
            
            return layout
    }
}
