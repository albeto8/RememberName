//
//  UIImageExtension.swift
//  RememberName
//
//  Created by Mario Alberto Barragán Espinosa on 15/12/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import UIKit

extension UIImage {
    static func getImageFromDirectory(imageName: String) -> UIImage? {
        let url = FileManager.default.getDocumentsDirectory().appendingPathComponent(imageName).appendingPathExtension("jpg")
        return UIImage(contentsOfFile: url.path)
    }
}
