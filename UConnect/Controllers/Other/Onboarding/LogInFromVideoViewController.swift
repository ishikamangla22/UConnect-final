//
//  LogInFromVideoViewController.swift
//  UConnect
//
//  Created by student on 23/04/24.
//

import UIKit
import SafariServices
import FirebaseAuth

struct Constants {
    static let cornerRadius: CGFloat = 8.0
}

private let usernameEmailField: UITextField = {
    let field = UITextField()
    field.placeholder = "Username or Email..."
    field.returnKeyType = .next
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constants.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    field.layer.borderWidth = 1.0
    field.layer.borderColor = UIColor.secondaryLabel.cgColor
    return field
}()

private let passwordField: UITextField = {
    let field = UITextField()
    field.isSecureTextEntry = true
    field.placeholder = "Password..."
    field.returnKeyType = .continue
    field.leftViewMode = .always
    field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    field.autocapitalizationType = .none
    field.autocorrectionType = .no
    field.layer.masksToBounds = true
    field.layer.cornerRadius = Constants.cornerRadius
    field.backgroundColor = .secondarySystemBackground
    field.layer.borderWidth = 1.0
    field.layer.borderColor = UIColor.secondaryLabel.cgColor
    return field
}()

private let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("Log In", for: .normal)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = UIColor(hex: "#CC0066")
    button.setTitleColor(.white, for: .normal)
    return button
}()

//private let termsButton: UIButton = {
//    let button = UIButton()
//    button.setTitle("Terms Of Service", for: .normal)
//    button.setTitleColor(.secondaryLabel, for: .normal)
//    return button
//}()
//
//private let privacyButton: UIButton = {
//    let button = UIButton()
//    button.setTitle("Privacy Policy", for: .normal)
//    button.setTitleColor(.secondaryLabel, for: .normal)
//    return button
//}()

private let CreateAccountButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.label, for: .normal)
    button.setTitle("New User? Create An Account", for: .normal)
    return button
}()

private let headerView: UIView = {
    let header = UIView()
    let backgroundImageView = UIImageView(image: UIImage(named: "UConnect"))
    header.addSubview(backgroundImageView)
    header.clipsToBounds = true
    header.backgroundColor = .red
    return header
}()




class LogInFromVideoViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        CreateAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
//        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
//        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        addSubviews()
        view.backgroundColor = .systemBackground
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        
        headerView.frame = CGRect(
            x: 0,
            y: 0.0,
            width: view.width,
            height: view.height/3.0
        )
        
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
        CreateAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
//        termsButton.frame = CGRect(
//            x: 10,
//            y: view.height - view.safeAreaInsets.bottom-100,
//            width: view.width-20,
//            height: 50
//        )
//        
//        privacyButton.frame = CGRect(
//            x: 10,
//            y: view.height - view.safeAreaInsets.bottom-50,
//            width: view.width-20,
//            height: 50
//        )
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        //Add UConnect logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
//        view.addSubview(termsButton)
//        view.addSubview(privacyButton)
        view.addSubview(CreateAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        //login functionality
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"),usernameEmail.contains(".") {
            //email
            email = usernameEmail
        }
        else {
            //username
            username = usernameEmail
        }
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // User logged in successfully
                    // Check if a user is currently signed in
                    if let user = Auth.auth().currentUser {
                        // User is signed in, retrieve the UID
                        let userId = user.uid
                        // Now you can use userId as the user's unique identifier
                        print("User UID: \(userId)")
                        
                        // User is signed in, retrieve the ID token
                        user.getIDToken(completion: { (token, error) in
                            if let error = error {
                                print("Error retrieving ID token: \(error.localizedDescription)")
                                // Handle error
                            } else if let token = token {
                                // Token successfully retrieved, use it as needed
                                print("ID token: \(token)")
                                // Proceed with using the token for authentication or other purposes
                            }
                        })
                    } else {
                        // No user is currently signed in
                        print("No user signed in")
                        // Handle scenario where no user is signed in
                    }
                    
                    // Dismiss the current view controller
                    self.dismiss(animated: true, completion: nil)
                    
                    // Instantiate the tab bar controller from the storyboard
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarControllerID") as? UITabBarController else {
                        print("Error: Could not instantiate TabBarController from storyboard.")
                        return // Exit the function if instantiation fails
                    }
                    
                    // Set modalPresentationStyle to fullScreen
                    tabBarController.modalPresentationStyle = .fullScreen
                    
                    // Present the tab bar controller from the current view controller
                    self.present(tabBarController, animated: true, completion: nil)
                } else {
                    // Login error occurred
                    let alert = UIAlertController(title: "Log In Error", message: "We were unable to log you in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
//    @objc private func didTapTermsButton() {
//        guard let url = URL(string: "") else {
//            return
//        }
//        let vc = SFSafariViewController(url: url)
//        present(vc,animated:true)
//    }
//    
//    @objc private func didTapPrivacyButton() {
//        guard let url = URL(string: "") else {
//            return
//        }
//        let vc = SFSafariViewController(url: url)
//        present(vc,animated:true)
//    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
}

extension LogInFromVideoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}

