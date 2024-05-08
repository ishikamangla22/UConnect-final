//
//  UploadsViewController.swift
//  UConnect
//
//  Created by student on 06/05/24.
//

import UIKit

class UploadsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
        
        // Loop through the navigation stack to find the RequestsViewController
        for viewController in self.navigationController?.viewControllers ?? [] {
            if let requestViewController = viewController as? RequestsViewController {
                // If found, pop back to the RequestsViewController
                self.navigationController?.popToViewController(requestViewController, animated: true)
                return
            }
        }
        
        // If RequestViewController is not found in the navigation stack, print an error message
        print("RequestViewController not found in navigation stack")
        
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
