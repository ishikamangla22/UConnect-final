//
//  GroupChatViewController.swift
//  UConnect
//
//  Created by Vibho Sharma on 04/05/24.
//

import UIKit

class GroupChatViewController: UIViewController {
    
    // Properties to hold community name and members
    var communityName: String?
    var members: [String] = [] // Initialize an empty array for members
    var chatMessages: [ChatMessage] = [] // Array to hold chat messages
    
    // Text view to display chat messages
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .white
        textView.backgroundColor = .black
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up UI
        setupUI()
        
        // Load chat messages
        loadChatMessages()
    }
    
    // Set up UI
    private func setupUI() {
        view.backgroundColor = .black // Set view background color to black
        title = communityName
        
        // Add text view to the view hierarchy
        view.addSubview(textView)
        
        // Set constraints for the text view
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    // Load chat messages (sample data for demonstration)
    private func loadChatMessages() {
        // Sample chat messages (assuming members have their own messages)
        for member in members {
            // Generate some sample chat messages for each member
            for _ in 0..<Int.random(in: 5...20) {
                let message = ChatMessage(sender: member, text: randomMessage())
                chatMessages.append(message)
            }
        }
        
        // Display chat messages in the text view
        var chatText = ""
        for message in chatMessages {
            chatText += "\(message.sender): \(message.text)\n\n"
        }
        textView.text = chatText
    }
    
    // Generate random chat message
    private func randomMessage() -> String {
        let messages = [
            "Hello!",
            "How are you?",
            "Nice to meet you!",
            "What's up?",
            "I'm doing great!",
            "This is awesome!",
            "Let's chat!",
            "Good to see you!",
            "How's your day?",
            "I'm here!",
            "Any news?",
            "How's the weather?",
            "Let's catch up!",
            "Having fun?",
            "I'm excited!",
            "Let's hang out!",
            "What's new?",
            "Nice weather today!",
            "Enjoying the day?",
            "Cheers!"
        ]
        return messages.randomElement() ?? "Sample message"
    }
}

// Model for chat messages
struct ChatMessage {
    let sender: String
    let text: String
}
