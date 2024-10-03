//
//  ImageStorageManager.swift
//  Fit-Check
//
//  Created by Nate Mackintosh on 10/2/24.
//

import SwiftUI
import FirebaseStorage
import UIKit

class ImageStorageManager: ObservableObject {
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
                self.errorMessage = "Error uploading image: \(error.localizedDescription)"
            } else {
                self.errorMessage = "Image uploaded successfully!"
            }
        }
    }
