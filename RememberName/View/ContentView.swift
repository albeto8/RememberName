//
//  ContentView.swift
//  RememberName
//
//  Created by Mario Alberto Barragán Espinosa on 15/12/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pictures = [Picture]()
    @State private var showingAddPicture = false
    @State private var selectedImage: UIImage?
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            List(pictures.sorted()) { picture in
                NavigationLink(destination: DetailView(picture: picture)) {
                    HStack {
                        Image(uiImage: UIImage.getImageFromDirectory(imageName: picture.name)!)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(picture.name)
                    }
                }
            }
            .navigationBarTitle("RememberName")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddPicture = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddPicture, onDismiss: saveData) {
                AddPictureView(pictures: self.$pictures, lastLocation: self.locationFetcher.lastKnownLocation)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        self.locationFetcher.start()
        let filename = FileManager.default.getDocumentsDirectory().appendingPathComponent("SavedPictures")

        do {
            let data = try Data(contentsOf: filename)
            pictures = try JSONDecoder().decode([Picture].self, from: data)
        } catch {
            print("Unable to load saved data.")
        }
    }
    
    func saveData() {
        do {
            let filename = FileManager.default.getDocumentsDirectory().appendingPathComponent("SavedPictures")
            let data = try JSONEncoder().encode(self.pictures)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
