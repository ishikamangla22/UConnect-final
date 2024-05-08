//
//  NotificationViewController.swift
//  UConnect
//
//  Created by student on 04/05/24.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var notificationTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationTableView.dataSource = self
        notificationTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return notifications[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationTableViewCell
//
//        let notification = notifications[indexPath.section][indexPath.row]
//        
//        let imageCommunity = UIImage(named: notification.communityProfileImageName)
//        
//        cell.communityProfileImage.image = imageCommunity
//        cell.communityName.text = notification.communityName
//        cell.descriptionText.text = notification.descriptionMessage
//        
//        return cell
//        
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return notifications.count
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            let sectionKeys = Array(notifications.keys)
            let sectionKey = sectionKeys[section]
            return notifications[sectionKey]?.count ?? 0
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationTableViewCell
            
//            let sectionKeys = Array(notifications.keys)
            let sectionKey = sectionKeys[indexPath.section]
            if let notification = notifications[sectionKey]?[indexPath.row] {
                cell.communityName?.text = notification.communityName
                cell.descriptionText?.text = notification.descriptionMessage
                cell.communityProfileImage?.image = UIImage(named: notification.communityProfileImageName)
            }
            
            return cell
        }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            let sectionKeys = Array(notifications.keys)
            return sectionKeys[section]
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Perform segue when a row is selected
        performSegue(withIdentifier: "popDancers", sender: nil)
        
        // Deselect the row after segue is performed
        tableView.deselectRow(at: indexPath, animated: true)
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
