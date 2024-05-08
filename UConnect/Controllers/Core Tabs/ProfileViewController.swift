//
//  ProfileViewController.swift
//  UConnect
//
//  Created by Student on 07/05/24.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sections[indexPath.row], for: indexPath) as! ProfileTableViewCell
        
        switch indexPath.row{
        case 0:
            cell.communitiesCount.text = "9"
        case 1:
            cell.postsCount.text = "20"
        case 2:
            cell.branchName.text = "BE CSE"
        case 3:
            cell.dobLabel.text = "FEB23,2004"
        case 4:
            cell.genderLabel.text = "Female"
        case 5:
            cell.emailLabel.text = "Radha2@gmail.com"
        default:
            print("hello")
        }
        return cell
    }
    
    var sections: [String] = ["communities", "posts", "branch", "dob", "gender", "email"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
//        textField.multiline = true
//        textField.numberOfLines = 0 // Set to 0 to allow unlimited lines
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
