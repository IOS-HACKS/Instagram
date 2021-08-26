//
//  StorageManager.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 01/12/20.
//

import Foundation
import FirebaseStorage


public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManageError: Error {
        case failedToDownload
    }
    
    public func uploadUserPhotoPost(model: UserPost, completion: (Result<URL, Error>))->Void {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManageError>)->Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        } )
    }
    
}
