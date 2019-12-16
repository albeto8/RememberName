//
//  DetailView.swift
//  RememberName
//
//  Created by Mario Alberto Barragán Espinosa on 15/12/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var picture: Picture
    
    var body: some View {
        VStack {
            Text(picture.name)
                .fontWeight(.heavy)
                .font(.largeTitle)
            Image(uiImage: UIImage.getImageFromDirectory(imageName: picture.name)!)
            .resizable()
            .frame(width: 400, height: 400)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(picture: Picture(name: "Mario", imageURL: FileManager.default.getDocumentsDirectory().appendingPathComponent("Mario").appendingPathExtension("jpg")))
    }
}
