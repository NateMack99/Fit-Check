//
//  ImageStorageManager.swift
//  Fit-Check
//
//  Created by Nate Mackintosh on 10/2/24.
//

import SwiftUI
import FirebaseStorage
import UIKit

class TestImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isUploading: Bool = false
    @Published var isDownloading: Bool = false
    @Published var alertItem: AlertItem? = nil
    
    private let storage = Storage.storage()
    
    // Upload image to Firebase Storage
    func uploadImage(_ image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        isUploading = true
        
        // Create a reference to Firebase Storage
        let storageRef = storage.reference().child("images/\(UUID().uuidString).jpg")
        
        // Upload the image data
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            self.isUploading = false
            
            if let error {
                print("Error uploading image: \(error.localizedDescription)")
            } else {
                print("Image uploaded successfully!")
            }
        }
    }
    
    func downloadImage(from path: String) {
           isDownloading = true

           // Create a reference to Firebase Storage
           let storageRef = storage.reference().child(path)

           // Download the image data
           storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
               self.isDownloading = false

               if let error = error {
                   print("Error downloading image: \(error.localizedDescription)")
                   return
               }

               if let data = data, let uiImage = UIImage(data: data) {
                   self.image = uiImage
               } else {
                   print("Unable to load image")
               }
           }
       }
}
