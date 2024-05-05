////
////  ProfileViewController.swift
////  UConnect
////
////  Created by student on 22/04/24.
////
//
//import UIKit
//
/////Profile view controller
//final class ProfileViewController: UIViewController, UITableViewDataSource {
//    
////    private var collectionView: UICollectionView?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        
////        configureNavigationBar()
////        
////        let layout = UICollectionViewFlowLayout()
////        layout.scrollDirection = .vertical
////        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
////        layout.itemSize = CGSize(width: view.width/3, height: view.width/3)
////        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
////        
////        collectionView?.delegate = self
////        collectionView?.dataSource = self
////        
////        guard let collectionView = collectionView else {
////            return
////        }
////        view.addSubview(collectionView)
//        // Do any additional setup after loading the view.
//    }
//    
////    override func viewDidLayoutSubviews() {
////        super.viewDidLayoutSubviews()
////        collectionView?.frame = view.bounds
////    }
//    
////    private func configureNavigationBar() {
////        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingsButton))
////    }
//    
////    @objc private func didTapSettingsButton() {
////        let vc =  SettingsViewController()
////        vc.title = "Settings"
////        navigationController?.pushViewController(vc, animated: true)
////    }
////    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
////extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
////    
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return 0
////    }
////    
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        return UICollectionViewCell()
////    }
////    
////    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
////        collectionView.deselectItem(at: indexPath, animated: true)
////    }
////}
