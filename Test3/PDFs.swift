//
//  PDFs.swift
//  Test3
//
//  Created by ariya redddyy on 8/14/21.
//  Copyright © 2021 CFN. All rights reserved.
//

import Foundation
import UIKit
import PDFKit

var screenshot_num: Int = 1

//NOTE: This error appears regardless - nw_protocol_get_quic_image_block_invoke dlopen libquic failed
public func takeScreenshot() -> UIImage? {
        
        var image :UIImage? // Creates UI Image
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        image = UIGraphicsGetImageFromCurrentImageContext() // Assigns UI Image to screenshot of current view
        UIGraphicsEndImageContext()
    
        let pdfDocument = PDFDocument() //Init PDF Document
        let pdfPage = PDFPage(image: image!) // Create a PDF Page of thhe image
        pdfDocument.insert(pdfPage!, at: 0) // Insert the PDF Page into the PDF Document
    
        let data = pdfDocument.dataRepresentation()
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Gets default directory to save PDF
        
        
        let docURL = documentDirectory.appendingPathComponent("PDF-\(screenshot_num).pdf")
        do {
            try data?.write(to: docURL) //Writes data to the URL
        } catch(let error) {
            print("error is \(error.localizedDescription)")
        }
    
        print(docURL) //If you paste this URL into safari (on the ipad), the image displays
        screenshot_num += 1
        return image
}
