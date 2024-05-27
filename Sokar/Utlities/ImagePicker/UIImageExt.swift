//
//  UIImageExt.swift
//  Innate
//
//  Created by Taimoor Arif on 27/12/2023.
//

import Foundation
import SwiftUI
import UIKit

extension String {
    
    var getImageUrl: URL {
        
        let storageUrl = "https://innate.ml-bench.com/public/storage/"
        
        let imageUrl = storageUrl + "\(self)"
        
        return URL(string: imageUrl) ?? URL(fileURLWithPath: "")
    }
}

extension UIImage {
   
    var convertToBase64: String {
        
        let compressedImage = self.resizeAndCompressImage()
        
        let compressedString = compressedImage.base64EncodedString()
        
        return compressedString
    }
}

func getUIImage(url: URL, completion: @escaping (UIImage) -> Void) {
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
            completion(UIImage())
            return
        }
        
        let image = UIImage(data: data)
        completion(image ?? UIImage())
    }
    
    task.resume()
}


extension URL {
    
    var getUIImage: UIImage {
        
        if let data = try? Data(contentsOf: self) {
            
            let image: UIImage = UIImage(data: data) ?? UIImage()
            
            return image
        } else {
            
            return UIImage()
        }
    }
}

extension UIImage {
    
    func resizeAndCompressImage() -> Data {
        guard let reducedImage = self.resizeImage() else {
            debugPrint("Image is not compressed")
            return Data()
        }
        
        guard let compressedImage = reducedImage.compressImage() else {
            debugPrint("image not compressed")
            return Data()
        }
        
        return compressedImage
    }
    
    func resizeImage() -> UIImage? {
        let targetHeight: CGFloat = min(self.size.height, 1200) // Change this value for smaller/bigger images
        let aspectRatio = self.size.width / self.size.height
        let targetWidth = targetHeight * aspectRatio
        
        let newSize = CGSize(width: targetWidth, height: targetHeight)
        
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let resizedImage = renderer.image { context in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return resizedImage
    }
    
    func compressImage() -> Data? {
        let targetSizeInKB = 300 // Change this value for smaller/bigger quality
        var compressionQuality: CGFloat = 1.0
        let maxSizeInBytes = targetSizeInKB * 1024 // Convert KB to bytes

        guard var compressedData = self.jpegData(compressionQuality: compressionQuality) else {
            return nil // Return nil if initial compression fails
        }

        while compressedData.count > maxSizeInBytes && compressionQuality > 0 {
            compressionQuality -= 0.05 // Adjust the compression quality

            guard let newCompressedData = self.jpegData(compressionQuality: compressionQuality) else {
                break // Break the loop if compression fails
            }

            compressedData = newCompressedData
        }

        return compressedData
    }
}
