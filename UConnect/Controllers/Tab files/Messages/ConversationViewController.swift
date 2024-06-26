//
//  ViewController.swift
//  messagetab
//
//  Created by Sharanpreet Singh  on 24/04/24.
//

import UIKit

import FirebaseAuth
import JGProgressHUD

class ConversationsViewController: UIViewController  {
    
    
    
    
    private let Spinner = JGProgressHUD(style: .dark)

    private let tableview : UITableView = {
       let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private let noConversationsLabel: UILabel = {
        let label = UILabel()
        label.text =  "No Conversations !"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 21, weight: .medium )
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(didTapComposeButton))
        view.addSubview(tableview)
        view.addSubview(noConversationsLabel )
        setupTableView()
        fetchConversation()
        
    }
    
    @objc private func didTapComposeButton(){
        let vc = NewConversationViewController()
        vc.completion = {[weak self] result in
          
            self?.createNewConversation(result: result)
        }
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    private func createNewConversation(result : [String: String]){
        guard let name = result["name"] , let email = result["email"] else {
            return
        }
        let vc = ChatViewController(with: email)
        vc .isNewConversation = true
        vc.title = name
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc , animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    
    }
    private func validateAuth(){
   if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
            
        }
    }

    private func setupTableView(){
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    private func fetchConversation(){
        tableview.isHidden = false
        
    }

}
extension ConversationsViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World "
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ChatViewController(with : "sdfdsf@gmail.com")
        vc.title = "Sharan"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc , animated: true)
    }
    
}


