
  

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

import SwiftUI

class HomeViewController: UIViewController  {

    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Communities"
        
        
    }
    
    @IBAction func didTapNewNote() {
        
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
//
    
    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            
            // Create a SwiftUI view
            let postlistView = PostCard()
            
            // Wrap the SwiftUI view in a UIHostingController
            let hostingController = UIHostingController(rootView: postlistView)

            // Add the hosting controller's view as a subview
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            hostingController.didMove(toParent: self)
            break
        case 1:
            cardImageView.image = UIImage(named: "pop_icon")
            break
        case 2:
            cardImageView.image = UIImage(named: "hip_icon")
            break
        default:
            break
        }
    }
}
