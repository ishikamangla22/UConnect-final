import UIKit

class RequestsViewController: UIViewController {

    var titleLabel: UILabel!
    var segmentController: UISegmentedControl!
    var tableView: UITableView!
    var requests: [Request] = [] // Assuming there's a model named Request to hold request data

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        setupUI()
        loadRequests() // Load initial requests
    }
    
    

    private func loadRequests() {
        // Populate requests array with member requests data
        requests = [
            Request(name: "Vibho", community: "GeekyGods"),
            Request(name: "Ishika", community: "C2S2 Custody"),
            Request(name: "Sharan", community: "FoosBall"),
            Request(name: "Devanshu", community: "Motorcyclists"),
            // Add more member requests data as needed
        ]
        tableView.reloadData()
    }
    
    private func loadUploadRequests() {
        // Populate requests array with upload requests data
        requests = [
            Request(name: "Upload 1", community: "Community A"),
            Request(name: "Upload 2", community: "Community B"),
            // Add more upload requests data as needed
        ]
        tableView.reloadData()
    }
    
    private func setupUI() {
        // Title Label
        titleLabel = UILabel()
        titleLabel.text = "Requests"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor(named: "TitleColor")
        view.addSubview(titleLabel)

        // Segment Controller
        segmentController = UISegmentedControl(items: ["Members", "Uploads"]) // Changed segment titles
        segmentController.tintColor = UIColor(named: "SegmentControlColor")
        segmentController.selectedSegmentTintColor = UIColor(named: "SegmentControlSelectedColor")
        segmentController.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        segmentController.setWidth(view.bounds.width * 0.4, forSegmentAt: 0) // Set width to 40% of screen width
        segmentController.setWidth(view.bounds.width * 0.4, forSegmentAt: 1) // Set width to 40% of screen width
        view.addSubview(segmentController)

        // Table View
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.register(RequestTableViewCell.self, forCellReuseIdentifier: "RequestCell")
        view.addSubview(tableView)

        // Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentController.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            // Segment Controller Constraints
            segmentController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentController.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            // Table View Constraints
            tableView.topAnchor.constraint(equalTo: segmentController.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Add a valueChanged event for the segmented control
        segmentController.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
    }

    // Method to handle segmented control value change
    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            // Load requests for members
            loadRequests()
        case 1:
            // Load requests for upload
            loadUploadRequests()
        default:
            break
        }
    }
}

extension RequestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! RequestTableViewCell
        let request = requests[indexPath.row]
        cell.nameLabel.text = request.name
        cell.communityLabel.text = request.community
        
        // Set arrow button visibility based on segment index
        if segmentController.selectedSegmentIndex == 1 {
            cell.arrowButton.isHidden = false
        } else {
            cell.arrowButton.isHidden = true
        }
        
        // Set accept and reject buttons visibility based on segment index
        if segmentController.selectedSegmentIndex == 0 {
            cell.acceptButton.isHidden = false
            cell.rejectButton.isHidden = false
        } else {
            cell.acceptButton.isHidden = true
            cell.rejectButton.isHidden = true
        }
        
        // Set the reference to the requestsViewController in the cell
        cell.requestsViewController = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if segmentController.selectedSegmentIndex == 1 { // Check if segment index is for uploads
//            let uploadDetailsVC = UploadDetailsViewController()
//            let selectedUpload = requests[indexPath.row]
//            uploadDetailsVC.uploadName = selectedUpload.name
//            uploadDetailsVC.communityName = selectedUpload.community
//            navigationController?.pushViewController(uploadDetailsVC, animated: true)
//        }
    }
}

class RequestTableViewCell: UITableViewCell {
    var profileImageView: UIImageView!
    var nameLabel: UILabel!
    var acceptButton: UIButton!
    var rejectButton: UIButton!
    var communityLabel: UILabel!
    var arrowButton: UIButton!
    
    // Reference to the RequestsViewController
    weak var requestsViewController: RequestsViewController?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Profile Image View
        profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 20 // Make it circular
        profileImageView.layer.masksToBounds = true
        profileImageView.backgroundColor = UIColor.darkGray // Dark grey color as a placeholder
        contentView.addSubview(profileImageView)

        // Name Label
        nameLabel = UILabel()
        nameLabel.textColor = UIColor(named: "DarkPink") // Change to dark pink color
        contentView.addSubview(nameLabel)

        // Community Label
        communityLabel = UILabel()
        communityLabel.textColor = UIColor.gray // Set color to gray
        contentView.addSubview(communityLabel)

        // Accept Button
        acceptButton = UIButton()
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.setTitleColor(UIColor(named: "ButtonTextColor"), for: .normal)
        acceptButton.backgroundColor = UIColor.blue // Change to blue color
        acceptButton.layer.cornerRadius = 8
        acceptButton.layer.borderWidth = 1
        acceptButton.layer.borderColor = UIColor.blue.cgColor
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        contentView.addSubview(acceptButton)

        // Reject Button
        rejectButton = UIButton()
        rejectButton.setTitle("Reject", for: .normal)
        rejectButton.setTitleColor(UIColor(named: "ButtonTextColor"), for: .normal)
        rejectButton.backgroundColor = UIColor.red // Change to red color
        rejectButton.layer.cornerRadius = 8
        rejectButton.layer.borderWidth = 1
        rejectButton.layer.borderColor = UIColor.red.cgColor
        rejectButton.addTarget(self, action: #selector(rejectButtonTapped), for: .touchUpInside)
        contentView.addSubview(rejectButton)

        // Arrow Button
        arrowButton = UIButton()
        arrowButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        arrowButton.tintColor = UIColor.gray // Set color to gray
        contentView.addSubview(arrowButton)

        // Constraints
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        communityLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        rejectButton.translatesAutoresizingMaskIntoConstraints = false
        arrowButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Profile Image View Constraints
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),

            // Name Label Constraints
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            // Community Label Constraints
            communityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            communityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),

            // Accept Button Constraints
            acceptButton.trailingAnchor.constraint(equalTo: rejectButton.leadingAnchor, constant: -8),
            acceptButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            acceptButton.widthAnchor.constraint(equalToConstant: 80),
            acceptButton.heightAnchor.constraint(equalToConstant: 30),

            // Reject Button Constraints
            rejectButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            rejectButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rejectButton.widthAnchor.constraint(equalToConstant: 80),
            rejectButton.heightAnchor.constraint(equalToConstant: 30),

            // Arrow Button Constraints
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    @objc func acceptButtonTapped() {
        // Handle accept button tap
        guard let tableView = superview as? UITableView,
              let indexPath = tableView.indexPath(for: self) else {
            return
        }
        tableView.beginUpdates()
        requestsViewController?.requests.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }

    @objc func rejectButtonTapped() {
        // Handle reject button tap
        guard let tableView = superview as? UITableView,
              let indexPath = tableView.indexPath(for: self) else {
            return
        }
        tableView.beginUpdates()
        requestsViewController?.requests.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
}

// Model for holding request data
struct Request {
    let name: String
    let community: String
}
