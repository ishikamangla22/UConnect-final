//
//  LoginViewController.swift
//  UConnect
//
//  Created by student on 22/04/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var ishika = false
    
    @IBOutlet weak var LogInButton: UIButton!
    
    
    @IBOutlet weak var createAccuntButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 22
        passwordTextField.layer.cornerRadius = 22
        LogInButton.layer.cornerRadius = 22
        createAccuntButton.layer.cornerRadius = 22
        
        // border Color
        emailTextField.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField.layer.borderColor = UIColor.darkGray.cgColor
//        LogInButton.layer.borderColor = UIColor.white.cgColor
//        createAccuntButton.layer.borderColor = UIColor.white.cgColor
        
        
        // border Width
        emailTextField.layer.borderWidth = 1
        passwordTextField.layer.borderWidth = 1
        LogInButton.layer.borderWidth = 1
        createAccuntButton.layer.borderWidth = 1
        
        // Masks To Bound
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        LogInButton.layer.masksToBounds = true
        createAccuntButton.layer.masksToBounds = true
        
        

        // Do any additional setup after loading the view.
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
