import UIKit
import MobileCoreServices

class AddPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
        setupUI()
    }

    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemPink
        navigationItem.title = "Add"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
    }

    private func setupUI() {
        // Profile Photo Placeholder
        let profilePlaceholder = UIView()
        profilePlaceholder.backgroundColor = .darkGray
        profilePlaceholder.layer.cornerRadius = 20
        profilePlaceholder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profilePlaceholder)

        // New Community Label
        let newCommunityLabel = UILabel()
        newCommunityLabel.text = "New Community"
        newCommunityLabel.textColor = .white
        newCommunityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newCommunityLabel)

        // Circle for New Community
        let newCommunityCircle = UIView()
        newCommunityCircle.backgroundColor = .darkGray
        newCommunityCircle.layer.cornerRadius = 10
        newCommunityCircle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newCommunityCircle)

        // Arrow Icon
        let arrowImageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        arrowImageView.tintColor = .white
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(arrowImageView)

        // New Post Label
        let newPostLabel = UILabel()
        newPostLabel.text = "New Post"
        newPostLabel.textColor = .lightGray
        newPostLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newPostLabel)

        // Communities Labels
        let communityLabels = ["Community A", "Community B", "Community C"]
        var previousCircle: UIView?
        var previousLabel: UILabel?

        for community in communityLabels {
            let communityStackView = UIStackView()
            communityStackView.translatesAutoresizingMaskIntoConstraints = false
            communityStackView.axis = .horizontal
            communityStackView.spacing = 10
            view.addSubview(communityStackView)

            let communityCircle = UIView()
            communityCircle.backgroundColor = .darkGray
            communityCircle.layer.cornerRadius = 10
            communityCircle.translatesAutoresizingMaskIntoConstraints = false
            communityStackView.addArrangedSubview(communityCircle)

            let communityLabel = UILabel()
            communityLabel.text = community
            communityLabel.textColor = .white
            communityLabel.translatesAutoresizingMaskIntoConstraints = false
            communityStackView.addArrangedSubview(communityLabel)

            // Add tap gesture recognizer to each community label
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(communityLabelTapped(_:)))
            communityLabel.isUserInteractionEnabled = true
            communityLabel.addGestureRecognizer(tapGestureRecognizer)

            NSLayoutConstraint.activate([
                // Profile Placeholder Constraints
                profilePlaceholder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                profilePlaceholder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                profilePlaceholder.widthAnchor.constraint(equalToConstant: 40),
                profilePlaceholder.heightAnchor.constraint(equalToConstant: 40),

                // New Community Label Constraints
                newCommunityLabel.leadingAnchor.constraint(equalTo: profilePlaceholder.trailingAnchor, constant: 10),
                newCommunityLabel.centerYAnchor.constraint(equalTo: profilePlaceholder.centerYAnchor),

                // Arrow Icon Constraints
                arrowImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                arrowImageView.centerYAnchor.constraint(equalTo: newCommunityLabel.centerYAnchor),

                // New Post Label Constraints
                newPostLabel.topAnchor.constraint(equalTo: profilePlaceholder.bottomAnchor, constant: 20),
                newPostLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                newPostLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                // Community StackView Constraints
                communityStackView.leadingAnchor.constraint(equalTo: newPostLabel.leadingAnchor),
                communityStackView.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? newPostLabel.bottomAnchor, constant: 20),
            ])

            previousCircle = communityCircle
            previousLabel = communityLabel
        }

        // Add tap gesture recognizer to New Community label
        let newCommunityTapGesture = UITapGestureRecognizer(target: self, action: #selector(newCommunityLabelTapped))
        newCommunityLabel.isUserInteractionEnabled = true
        newCommunityLabel.addGestureRecognizer(newCommunityTapGesture)
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func communityLabelTapped(_ sender: UITapGestureRecognizer) {
        // Present action sheet with options to open gallery or cancel
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let openGalleryAction = UIAlertAction(title: "Open Gallery", style: .default) { _ in
            // Open gallery
            self.openGallery()
        }
        alertController.addAction(openGalleryAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    @objc private func newCommunityLabelTapped() {
        let newCommunityVC = NewCommunityViewController() // Assuming NewCommunityViewController exists
        navigationController?.pushViewController(newCommunityVC, animated: true)
    }

    private func openGallery() {
        // Check if the photo library is available
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // Initialize UIImagePickerController
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String] // Set media type to images only
            imagePicker.delegate = self // Set the delegate
            present(imagePicker, animated: true, completion: nil)
        } else {
            // Photo library not available
            let alert = UIAlertController(title: "Error", message: "Gallery not available", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate

extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        guard let selectedImage = info[.originalImage] as? UIImage else {
            return
        }

        // Navigate to NewPostDetailsViewController
        let newPostDetailsVC = NewPostDetailsViewController(image: selectedImage)
        navigationController?.pushViewController(newPostDetailsVC, animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
