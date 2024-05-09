//
//  StorageManager.swift
//  UConnect
//
//  Created by student on 23/04/24.
//

import Foundation
import FirebaseStorage

final class StorageManager{
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    /*
     /images/afraz9-gmail-com_profile_picture.png
    */
  
    public typealias UploadPictureCompletion = (Result<String,Error>) -> Void
    /// Uploads picture to firebase storage and returns completion with url string to download
    public func uploadProfilePicture(with data : Data , fileName :String, completion : @escaping UploadPictureCompletion){
        storage.child("image/\(fileName)").putData(data, metadata: nil,completion: {metadata, error in
            
            guard error == nil else{
                //failed
                print("Failed to upload data to firebase for picture ")
                completion(.failure(StorageError.failedToUpload))
                return
            }
            let reference = self.storage.child("image/\(fileName)").downloadURL(completion: {url,error in
                guard let url = url else {
                    print("Failed to get download url")
                    completion(.failure( StorageError.failedToGetDownloadUrl))
                    return
                }
                let urlString = url.absoluteString
                print ("Download url returned : \(urlString)")
                completion(.success(urlString))
            })
        })
    }
    public enum StorageError :Error {
        case failedToUpload
        case failedToGetDownloadUrl
    }
    public func downloadURL(for path: String,  completion : @escaping (Result<URL, Error>) -> Void){
        let reference = storage.child(path)
        reference.downloadURL(completion: {url, error in
            guard let url = url ,error == nil else {
                completion(.failure(StorageError.failedToGetDownloadUrl))
                return
            }
            completion(.success(url))
        })
    }
}
