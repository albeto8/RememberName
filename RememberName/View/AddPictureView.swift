//
//  AddPictureView.swift
//  RememberName
//
//  Created by Mario Alberto Barragán Espinosa on 15/12/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI
import CoreLocation

struct AddPictureView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var currentName = ""
    @State private var currentImage: UIImage?
    @State private var image: Image?
    @State private var showingImagePicker = false
    @Binding var pictures: [Picture]
    @State var lastLocation: CLLocationCoordinate2D?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .center) {
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Rectangle()
                        .fill(Color.secondary)
                        .frame(width: 300, height: 300)
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }.onTapGesture {
                    self.showingImagePicker = true
                }
                TextField("Picture name", text: $currentName)
                    .padding()
                Button("Save") {
                    self.saveImage()
                    self.presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
            .navigationBarTitle("Add Picture")
            .sheet(isPresented: self.$showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$currentImage)
            }
        }
    }
    
    func saveImage() {
        if !self.currentName.isEmpty && self.currentImage != nil {
            let pathToSaveImage = FileManager.default.getDocumentsDirectory().appendingPathComponent(self.currentName).appendingPathExtension("jpg")
            ImageSaver().writeToDisk(image: self.currentImage!, url: pathToSaveImage)
            let picture = Picture(name: self.currentName, imageURL: pathToSaveImage, location: self.lastLocation)
            self.pictures.append(picture)
        }
    }
    
    func loadImage() {
        guard let currentImage = self.currentImage else { return }
        image = Image(uiImage: currentImage)
    }
}

struct AddPictureView_Previews: PreviewProvider {
    static var previews: some View {
        AddPictureView(pictures: .constant([Picture]()))
    }
}
