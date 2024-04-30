//
//  NewPostDetailsViewController.swift
//  UConnect
//
//  Created by Vibho Sharma on 30/04/24.
//

import UIKit

class NewPostDetailsViewController: UIViewController {

    private let selectedImage: UIImage
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Write a description..."
        textField.textColor = UIColor.white
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(image: UIImage) {
        self.selectedImage = image // Initialize selected image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }

    private func setupUI() {
        // Add new post label
        let newPostLabel = UILabel()
        newPostLabel.text = "New Post"
        newPostLabel.textColor = .white
        newPostLabel.textAlignment = .center
        newPostLabel.font = UIFont.boldSystemFont(ofSize: 20)
        newPostLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newPostLabel)
        
        // Add image view
        view.addSubview(imageView)
        
        // Set selected image to the image view
        imageView.image = selectedImage
        
        // Add description text field
        view.addSubview(descriptionTextField)
        
        // Add time limit row with distinguished background
        let timeLimitView = UIView()
        timeLimitView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        timeLimitView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeLimitView)
        
        // Add sandglass icon
        let sandglassIcon = UIImageView(image: UIImage(systemName: "hourglass"))
        sandglassIcon.tintColor = .white
        sandglassIcon.translatesAutoresizingMaskIntoConstraints = false
        timeLimitView.addSubview(sandglassIcon)
        
        // Add time limit label
        let timeLimitLabel = UILabel()
        timeLimitLabel.text = "Time Limit: 24 hours"
        timeLimitLabel.textColor = .white
        timeLimitLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLimitView.addSubview(timeLimitLabel)
        
        // Add share button
        let shareButton = UIButton()
        shareButton.backgroundColor = UIColor.systemPink
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.layer.cornerRadius = 10
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        view.addSubview(shareButton)
        
        NSLayoutConstraint.activate([
            // New post label constraints
            newPostLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newPostLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            // Image view constraints
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: newPostLabel.bottomAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            // Description text field constraints
            descriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Time limit row constraints
            timeLimitView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timeLimitView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timeLimitView.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
            timeLimitView.heightAnchor.constraint(equalToConstant: 50),
            
            // Sandglass icon constraints
            sandglassIcon.leadingAnchor.constraint(equalTo: timeLimitView.leadingAnchor, constant: 20),
            sandglassIcon.centerYAnchor.constraint(equalTo: timeLimitView.centerYAnchor),
            
            // Time limit label constraints
            timeLimitLabel.leadingAnchor.constraint(equalTo: sandglassIcon.trailingAnchor, constant: 10),
            timeLimitLabel.centerYAnchor.constraint(equalTo: timeLimitView.centerYAnchor),
            
            // Share button constraints
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func shareButtonTapped() {
        // Handle share button tap
    }

}
