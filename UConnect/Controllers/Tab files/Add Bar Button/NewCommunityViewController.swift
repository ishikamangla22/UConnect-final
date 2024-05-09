//  NewCommunityViewController.swift
//  UConnect
//
//  Created by Vibho Sharma on 30/04/24.
//

import UIKit

class NewCommunityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: - Properties

    var communityNameTextField: UITextField!
    var communityDescriptionTextField: UITextField!
    var domainLabel: UILabel!
    var domainChevronLabel: UILabel!
    var domainPickerView: UIPickerView!
    var imageView: UIImageView!
    var addPhotoButton: UIButton!

    var selectedImage: UIImage?

    let domains = ["Technology", "Art", "Culture", "Sports", "Fashion", "Food", "Music", "Travel", "Health"]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black // Set background color to black
        setupNavigationBar()
        setupUI()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        navigationItem.title = "New Community"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .blue
    }

    private func setupUI() {
        // Image View
        imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // Add Photo Button
        addPhotoButton = UIButton(type: .system)
        addPhotoButton.setTitle("Add Photo", for: .normal)
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addPhotoButton)

        // Community Name Text Field
        communityNameTextField = UITextField()
        communityNameTextField.placeholder = "Community Name"
        communityNameTextField.backgroundColor = .systemGray6 // Set background color to slate grey
        communityNameTextField.layer.cornerRadius = 5
        communityNameTextField.layer.masksToBounds = true
        communityNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(communityNameTextField)

        // Community Description Text Field
        communityDescriptionTextField = UITextField()
        communityDescriptionTextField.placeholder = "Community Description" // Placeholder text
        communityDescriptionTextField.backgroundColor = .systemGray6 // Set background color to slate grey
        communityDescriptionTextField.layer.cornerRadius = 5
        communityDescriptionTextField.layer.masksToBounds = true
        communityDescriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(communityDescriptionTextField)

        // Domain Label
        domainLabel = UILabel()
        domainLabel.text = "Domain"
        domainLabel.textColor = .white
        domainLabel.backgroundColor = .systemGray6 // Set background color to slate grey
        domainLabel.textAlignment = .left // Align chevron to the left
        domainLabel.isUserInteractionEnabled = true
        domainLabel.translatesAutoresizingMaskIntoConstraints = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(domainLabelTapped))
        domainLabel.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(domainLabel)
        
        // Domain Chevron Label
        domainChevronLabel = UILabel()
        domainChevronLabel.text = "\u{25BC}" // Downward triangle unicode
        domainChevronLabel.textColor = .white
        domainChevronLabel.textAlignment = .right // Align chevron to the right
        domainChevronLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(domainChevronLabel)

        // Domain Picker View
        domainPickerView = UIPickerView()
        domainPickerView.dataSource = self
        domainPickerView.delegate = self
        domainPickerView.translatesAutoresizingMaskIntoConstraints = false
        domainPickerView.isHidden = true
        view.addSubview(domainPickerView)

        NSLayoutConstraint.activate([
            // Image View Constraints
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),

            // Add Photo Button Constraints
            addPhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30), // Increased spacing
            addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Community Name Text Field Constraints
            communityNameTextField.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 40), // Increased spacing
            communityNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            communityNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            communityNameTextField.heightAnchor.constraint(equalToConstant: 40), // Reduced height

            // Community Description Text Field Constraints
            communityDescriptionTextField.topAnchor.constraint(equalTo: communityNameTextField.bottomAnchor, constant: 20), // Reduced spacing
            communityDescriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            communityDescriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            communityDescriptionTextField.heightAnchor.constraint(equalToConstant: 40), // Increased height

            // Domain Label Constraints
            domainLabel.topAnchor.constraint(equalTo: communityDescriptionTextField.bottomAnchor, constant: 40), // Increased spacing
            domainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            domainLabel.heightAnchor.constraint(equalToConstant: 40), // Height for consistency
            domainLabel.trailingAnchor.constraint(equalTo: domainChevronLabel.leadingAnchor, constant: 30), // Added trailing constraint to chevron
            
            // Domain Chevron Label Constraints
            domainChevronLabel.topAnchor.constraint(equalTo: domainLabel.topAnchor),
            domainChevronLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            domainChevronLabel.bottomAnchor.constraint(equalTo: domainLabel.bottomAnchor),
            domainChevronLabel.widthAnchor.constraint(equalToConstant: 20), // Width for consistency

            // Domain Picker View Constraints
            domainPickerView.topAnchor.constraint(equalTo: domainLabel.bottomAnchor, constant: 5),
            domainPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            domainPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            domainPickerView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    // MARK: - Actions

    @objc private func doneButtonTapped() {
        // Handle done button tap action here
    }

    @objc private func addPhotoButtonTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    @objc private func domainLabelTapped() {
        domainPickerView.isHidden = !domainPickerView.isHidden // Toggle visibility
        if !domainPickerView.isHidden {
            domainPickerView.reloadAllComponents() // Reload picker view data
        }
        view.bringSubviewToFront(domainPickerView) // Bring the picker view to the front
    }

    // MARK: - UIImagePickerControllerDelegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
        selectedImage = image
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return domains.count
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return domains[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        domainLabel.text = domains[row] // Set domain label text
        domainPickerView.isHidden = true
    }
}
