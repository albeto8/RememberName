//
//  Picture.swift
//  RememberName
//
//  Created by Mario Alberto Barragán Espinosa on 15/12/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import UIKit

struct Picture: Identifiable, Codable, Comparable {
    let id = UUID()
    let name: String
    let imageURL: URL
    
    static func < (lhs: Picture, rhs: Picture) -> Bool {
        lhs.name < rhs.name
    }
}
