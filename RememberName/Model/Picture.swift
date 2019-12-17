//
//  Picture.swift
//  RememberName
//
//  Created by Mario Alberto Barragán Espinosa on 15/12/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import UIKit
import CoreLocation

struct Picture: Identifiable, Codable, Comparable {
    let id = UUID()
    let name: String
    let imageURL: URL
    let latitude: Double?
    let longitude: Double?
    
    init(name: String, imageURL: URL, location: CLLocationCoordinate2D?) {
        self.name = name
        self.imageURL = imageURL
        guard let location = location else {
            latitude = nil
            longitude = nil
            return
        }
        self.latitude = location.latitude
        self.longitude = location.longitude
    }

    var location: CLLocationCoordinate2D? {
        guard let latitude = latitude, let longitude = longitude else {
            return nil
        }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func < (lhs: Picture, rhs: Picture) -> Bool {
        lhs.name < rhs.name
    }
}
