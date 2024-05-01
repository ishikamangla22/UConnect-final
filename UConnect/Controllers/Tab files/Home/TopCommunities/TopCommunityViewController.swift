//
//  TopCommunityViewController.swift
//  UConnect
//
//  Created by Sharanpreet Singh  on 26/04/24.
//

import UIKit

struct Community{
    var image: String
    var name: String
    var memberCount: Int
}

var communities: [Community] = [
    Community(image: "Legendary Set pic ", name: "Kickin’ Crew", memberCount: 100),
    Community(image: "Legendary Set pic ", name: "The Cult of Classic Literature", memberCount: 50),
    Community(image: "Noice Set pic ", name: "Noice Set", memberCount: 200),
    Community(image: "Legendary Set pic ", name: "Fierce Matrix", memberCount: 150),
    Community(image: "Legendary Set pic ", name: "Savage Squad", memberCount: 250),
    Community(image: "Iconic Force pic ", name: "Iconic Force", memberCount: 300),
    Community(image: "Legendary Set pic ", name: "Legendary Set", memberCount: 350),
    Community(image: "Beastly Syndicate pic ", name: "Beastly Syndicate",memberCount: 400),
    Community(image: "Spifftacular Troop pic ", name: "Spifftacular Troop", memberCount: 450),
    Community(image: "smooth phase pic ", name: "Smooth Posse", memberCount: 500),
    Community(image: "Choice Matrix pic ", name: "Choice Matrix", memberCount: 550),
    Community(image: "Legendary Set pic ", name: "Amped Null Set", memberCount: 600),
    Community(image: "Legendary Set pic ", name: "Notorious Squad", memberCount: 650),
    Community(image: "Legendary Set pic ", name: "Community 14", memberCount: 700),
    Community(image: "Legendary Set pic ", name: "Community 15", memberCount: 750),
    Community(image: "Legendary Set pic ", name: "Community 16", memberCount: 800),
    Community(image: "Legendary Set pic ", name: "Community 17", memberCount: 850),
    Community(image: "Legendary Set pic ", name: "Community 18", memberCount: 900),
    Community(image: "Legendary Set pic ", name: "Community 19", memberCount: 950),
    Community(image: "Legendary Set pic ", name: "Community 20", memberCount: 1000),
    Community(image: "Legendary Set pic ", name: "Community 21", memberCount: 1050),
    Community(image: "Legendary Set pic ", name: "Community 22", memberCount: 1100),
    Community(image: "Legendary Set pic ", name: "Community 23", memberCount: 1150),
    Community(image: "Legendary Set pic ", name: "Community 24", memberCount: 1200),
    Community(image: "Legendary Set pic ", name: "Community 25", memberCount: 1250)
]

class TopCommunityViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var topCommunityTableView: UITableView!
 

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topCommunityCell", for: indexPath) as! topCommunityTableViewCell
        let community = communities[indexPath.row]
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

