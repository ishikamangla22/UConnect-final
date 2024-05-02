import UIKit

class UploadDetailsViewController: UIViewController {

    var titleLabel: UILabel!
    var uploaderCircleView: UIView!
    var uploaderNameLabel: UILabel!
    var communityLabel: UILabel!
    var postLabel: UILabel!
    var imageView: UIImageView!
    var descriptionLabel: UILabel!
    var approveButton: UIButton!
    var rejectButton: UIButton!

    var uploadName: String?
    var communityName: String?
    var image: UIImage?
    var descriptionText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        setupContent()
    }

    private func setupUI() {
        // Title Label
        titleLabel = UILabel()
        titleLabel.text = "Uploads"
        titleLabel.textColor = UIColor.systemPink
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(titleLabel)

        // Uploader Circle View
        uploaderCircleView = UIView()
        uploaderCircleView.backgroundColor = .lightGray
        uploaderCircleView.layer.cornerRadius = 20
        view.addSubview(uploaderCircleView)

        // Uploader Name Label
        uploaderNameLabel = UILabel()
        uploaderNameLabel.textColor = UIColor.white
        uploaderNameLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(uploaderNameLabel)

        // Community Label
        communityLabel = UILabel()
        communityLabel.textColor = UIColor.gray
        communityLabel.font = UIFont.systemFont(ofSize: 12) // Smaller font size
        view.addSubview(communityLabel)

        // Post Label
        postLabel = UILabel()
        postLabel.text = "Post"
        postLabel.textColor = .white
        postLabel.backgroundColor = UIColor(named: "DarkPink")
        postLabel.textAlignment = .center
        postLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(postLabel)

        // Image View
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "welcome") // Replace placeholder with "welcome" image
        view.addSubview(imageView)

        // Description Label
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(descriptionLabel)

        // Approve Button
        approveButton = UIButton()
        approveButton.setTitle("Approve", for: .normal)
        approveButton.backgroundColor = UIColor.systemPink
        approveButton.layer.cornerRadius = 8
        approveButton.addTarget(self, action: #selector(approveButtonTapped), for: .touchUpInside)
        view.addSubview(approveButton)

        // Reject Button
        rejectButton = UIButton()
        rejectButton.setTitle("Reject", for: .normal)
        rejectButton.backgroundColor = .white
        rejectButton.setTitleColor(UIColor.black, for: .normal)
        rejectButton.layer.cornerRadius = 8
        rejectButton.addTarget(self, action: #selector(rejectButtonTapped), for: .touchUpInside)
        view.addSubview(rejectButton)

        // Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        uploaderCircleView.translatesAutoresizingMaskIntoConstraints = false
        uploaderNameLabel.translatesAutoresizingMaskIntoConstraints = false
        communityLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        approveButton.translatesAutoresizingMaskIntoConstraints = false
        rejectButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            // Uploader Circle View Constraints
            uploaderCircleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            uploaderCircleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            uploaderCircleView.widthAnchor.constraint(equalToConstant: 40),
            uploaderCircleView.heightAnchor.constraint(equalToConstant: 40),

            // Uploader Name Label Constraints
            uploaderNameLabel.centerYAnchor.constraint(equalTo: uploaderCircleView.centerYAnchor),
            uploaderNameLabel.leadingAnchor.constraint(equalTo: uploaderCircleView.trailingAnchor, constant: 10),

            // Community Label Constraints
            communityLabel.topAnchor.constraint(equalTo: uploaderNameLabel.bottomAnchor, constant: 2),
            communityLabel.leadingAnchor.constraint(equalTo: uploaderNameLabel.leadingAnchor),

            // Post Label Constraints
            postLabel.topAnchor.constraint(equalTo: communityLabel.bottomAnchor, constant: 20),
            postLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postLabel.widthAnchor.constraint(equalToConstant: 60),
            postLabel.heightAnchor.constraint(equalToConstant: 30),

            // Image View Constraints
            imageView.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            // Description Label Constraints
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Approve Button Constraints
            approveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            approveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            approveButton.widthAnchor.constraint(equalToConstant: 100),
            approveButton.heightAnchor.constraint(equalToConstant: 40),

            // Reject Button Constraints
            rejectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            rejectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rejectButton.widthAnchor.constraint(equalToConstant: 100),
            rejectButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    private func setupContent() {
        uploaderNameLabel.text = uploadName
        communityLabel.text = "in \(communityName ?? "")"
        descriptionLabel.text = descriptionText ?? "No description available"
    }

    @objc func approveButtonTapped() {
        // Handle approve button tapped
    }

    @objc func rejectButtonTapped() {
        // Handle reject button tapped
    }
}
