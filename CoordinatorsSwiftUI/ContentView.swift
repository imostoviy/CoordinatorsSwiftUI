//
//  ContentView.swift
//  CoordinatorsSwiftUI
//
//  Created by Ihor Mostovyi on 13.02.2020.
//  Copyright © 2020 Ihor Mostovyi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingPicker = false

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()

            Button("Select image") {
                self.showingPicker = true
            }
        }
        .sheet(isPresented: $showingPicker, onDismiss: showImage) {
            ImagePicker(image: self.$inputImage)
        }
    }

    private func showImage() {
        guard let chousenImage = inputImage else { return }
        image = Image(uiImage: chousenImage)
        inputImage = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
