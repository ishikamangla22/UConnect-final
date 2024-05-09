//
//  TopCommunityViewController.swift
//  UConnect
//
//  Created by Sharanpreet Singh  on 26/04/24.
//

import UIKit

class TopCommunityViewController: UIViewController, UITableViewDataSource {
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        // Loop through the navigation stack to find the RequestsViewController
        for viewController in self.navigationController?.viewControllers ?? [] {
            if let homeViewController = viewController as? HomeViewController {
                // If found, pop back to the RequestsViewController
                self.navigationController?.popToViewController(homeViewController, animated: true)
                return
            }
        }
        
        // If RequestViewController is not found in the navigation stack, print an error message
        print("HomeViewController not found in navigation stack")
        
    }
    
    @IBOutlet weak var topCommunityTableView: UITableView!
 

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModelofCommunities.getAllCommunities().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topCommunityCell", for: indexPath) as! topCommunityTableViewCell
        
        let community = dataModelofCommunities.getAllCommunities()[indexPath.row]
        
        cell.profileImage.image = UIImage(named: community.image) ?? UIImage(named: "pic1")
        cell.communityNameLabel.text = community.name
        cell.memberCountLabel.text = "\(community.memberCount) members"
        return cell
    }
   
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            topCommunityTableView.dataSource = self
           
            
        }
//        @IBAction func searchButtonTapped(_ sender: UIButton) {
//            searchBar.isHidden = false // Show the search bar
//            searchBar.becomeFirstResponder() // Open the keyboard
//        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    
}

