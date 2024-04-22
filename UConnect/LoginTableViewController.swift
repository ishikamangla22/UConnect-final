//
//  LoginTableViewController.swift
//  UConnect
//
//  Created by student on 17/04/24.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.layer.cornerRadius = 19
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.masksToBounds = true
        
        passwordTextField.layer.cornerRadius = 19
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.masksToBounds = true
    }

}
