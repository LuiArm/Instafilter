//
//  ContentView.swift
//  Instafilter
//
//  Created by luis armendariz on 7/29/23.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
            Button("Select image"){
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker){
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage){ _ in loadImage() }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
