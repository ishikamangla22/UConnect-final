//
//  AddPostViewController.swift
//  UConnect
//
//  Created by student on 22/04/24.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        private let tableView: UITableView = {
            let tableView = UITableView()
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return tableView
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Requests"
            view.backgroundColor = .systemBackground
            view.addSubview(tableView)
            tableView.delegate = self
            tableView.dataSource = self
            
            // Do any additional setup after loading the view.
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
        
        
        // Do any additional setup after loading the view.
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
