
  

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

private let reuseIdentifier = "Cell"

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
   

//    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Communities"
        
        outerCollectionView.delegate = self
        outerCollectionView.dataSource = self
        
    }
    
    @IBAction func didTapNewNote() {
        
    }
    
    @IBOutlet weak var outerCollectionView: UICollectionView!
    
    
    
    private func handleNotAuthenticated() {
            // Check auth status
            if Auth.auth().currentUser == nil {
                // Show log in
                let loginVC = LogInFromVideoViewController()
                loginVC.modalPresentationStyle = .fullScreen
                present(loginVC, animated: false)
            }
        }
//
    
    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            outerCollectionView.isHidden = false

            outerCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
            
            outerCollectionView.delegate = self
            outerCollectionView.dataSource = self
            
            
            
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
            break
        case 1:
            outerCollectionView.isHidden = true

//            cardImageView.image = UIImage(named: "pop_icon")
            break
        case 2:
            outerCollectionView.isHidden = true

//            cardImageView.image = UIImage(named: "hip_icon")
            break
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        
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
    
}
