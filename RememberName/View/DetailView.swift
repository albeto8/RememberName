//
//  DetailView.swift
//  RememberName
//
//  Created by Mario Alberto Barragán Espinosa on 15/12/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI
import MapKit

struct DetailView: View {
    var picture: Picture
    
    var body: some View {
        VStack {
            Text(picture.name)
                .fontWeight(.heavy)
                .font(.largeTitle)
            Image(uiImage: UIImage.getImageFromDirectory(imageName: picture.name)!)
            .resizable()
                .frame(width: 200.0, height: 200.0)
            Spacer()
            VStack {
                MapView(centerCoordinate: picture.location)
            }
        }
    }
}
