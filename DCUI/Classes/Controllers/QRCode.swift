//
//  QRCode.swift
//  TX2
//
//  Created by Zilvinas Sebeika on 13/05/16.
//  Copyright © 2016 dclife. All rights reserved.
//

import Foundation
import CoreImage

public enum QRCorrectionLevel : String {
    case L = "L"
    case M = "M"
    case Q = "Q"
    case H = "H"
}

extension UIImage {
    
    public func QRImage(text: String, size: CGSize, correctionLevel: QRCorrectionLevel) -> UIImage? {
        
        let data = text.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue(correctionLevel.rawValue, forKey: "inputCorrectionLevel")
            if let cIImage = filter.outputImage {
                
                let scaleX = size.width / cIImage.extent.size.width
                let scaleY = size.height / cIImage.extent.size.height
                let transformedImage = cIImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                return UIImage(ciImage: transformedImage)
            }
        }
        
        return nil
    }
    
}
