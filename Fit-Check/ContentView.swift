//
//  ContentView.swift
//  Fit-Check
//
//  Created by Nate Mackintosh on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = TestImageViewModel()
    @State var uploadedImage: UIImage?
    @State var downLoadedImage: UIImage?
    @State var imagePath: String?
    
    var body: some View {
        VStack {
            Button {
                print("tapped")
                if let sysImage = UIImage(named: "TestImage.jpeg") {
                    uploadedImage = sysImage
                    imagePath = viewModel.uploadImage(sysImage)
                } else {
                    print("Image not found")
                }
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 100)
                        .foregroundStyle(Color.gray)
                    Text("Upload Image")
                }
            }
            
            Button {
                print("Downloading")
                viewModel.downloadImage(from: imagePath!)
                downLoadedImage = viewModel.image
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 100)
                        .foregroundStyle(Color.gray)
                    Text("DownloadImage")
                }
            }
            Button {
                viewModel.image = nil
                downLoadedImage = nil
                print("cleared!")
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 100)
                        .foregroundStyle(Color.red)
                    Text("Clear Image")
                }
            }
            if downLoadedImage != nil {
                Image(uiImage: downLoadedImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
        }
    }
}

#Preview {
    ContentView()
}
