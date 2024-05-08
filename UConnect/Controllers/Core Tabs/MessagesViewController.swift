//
//  MessagesViewController.swift
//  UConnect
//
//  Created by student on 22/04/24.
//

import UIKit
//import StreamChat
//import StreamChatUI
//
//// Display the channel list screen
//class DemoChannelList: ChatChannelListVC {}

//protocol MessageTabDelegate: AnyObject {
//    func messageTabSelected()
//}

class MessagesViewController: UIViewController {
    
//    weak var delegate: MessageTabDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set background color
        view.backgroundColor = UIColor.black
        
        // Add "Messages" label in top left corner
        let messagesLabel = UILabel()
        messagesLabel.text = "Messages"
        messagesLabel.textColor = UIColor.systemPink
        view.addSubview(messagesLabel)
        messagesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messagesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            messagesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        // Create community sections
        let communityNames = ["Community 1", "Community 2", "Community 3"]
        
        var previousView: UIView?
        for (index, communityName) in communityNames.enumerated() {
            // Create a container view for the community section
            let communityContainer = UIView()
            view.addSubview(communityContainer)
            communityContainer.translatesAutoresizingMaskIntoConstraints = false
            
            // Set constraints for the container view
            NSLayoutConstraint.activate([
                communityContainer.topAnchor.constraint(equalTo: (previousView != nil ? previousView!.bottomAnchor : messagesLabel.bottomAnchor), constant: 20),
                communityContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                communityContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                communityContainer.heightAnchor.constraint(equalToConstant: 40) // Adjust height as needed
            ])
            
            // Add tap gesture recognizer to the container view
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(communitySelected(_:)))
            communityContainer.addGestureRecognizer(tapGesture)
            communityContainer.tag = index + 1 // Assuming index starts from 0
            
            // Add placeholder circle
            let placeholderCircle = UIView()
            placeholderCircle.backgroundColor = UIColor.gray // Placeholder color
            placeholderCircle.layer.cornerRadius = 20 // Assuming a radius of 20 for the circle
            communityContainer.addSubview(placeholderCircle)
            placeholderCircle.translatesAutoresizingMaskIntoConstraints = false
            
            // Set constraints for placeholder circle
            NSLayoutConstraint.activate([
                placeholderCircle.leadingAnchor.constraint(equalTo: communityContainer.leadingAnchor, constant: 20),
                placeholderCircle.centerYAnchor.constraint(equalTo: communityContainer.centerYAnchor),
                placeholderCircle.widthAnchor.constraint(equalToConstant: 40), // Diameter of circle
                placeholderCircle.heightAnchor.constraint(equalToConstant: 40) // Diameter of circle
            ])
            
            // Add community name label
            let communityLabel = UILabel()
            communityLabel.text = communityName
            communityLabel.textColor = UIColor.white
            communityContainer.addSubview(communityLabel)
            communityLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Set constraints for community label
            NSLayoutConstraint.activate([
                communityLabel.leadingAnchor.constraint(equalTo: placeholderCircle.trailingAnchor, constant: 10),
                communityLabel.centerYAnchor.constraint(equalTo: communityContainer.centerYAnchor)
            ])
            
            // Set the current view as the previous one for the next iteration
            previousView = communityContainer
        }
    }
    
    // Function to handle community selection
    @objc func communitySelected(_ sender: UITapGestureRecognizer) {
        guard let communityIndex = sender.view?.tag else { return }
        let communityName = "Community \(communityIndex)"
        
        // Instantiate GroupChatViewController
        let groupChatVC = GroupChatViewController()
        // Pass community name to GroupChatViewController
        groupChatVC.communityName = communityName
        
        // Present GroupChatViewController
        navigationController?.pushViewController(groupChatVC, animated: true)
    }
    
//    // Call this method when the tab is selected
//    func tabSelected() {
//        delegate?.messageTabSelected()
//    }
}
