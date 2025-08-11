//
//  RemoteImage.swift
//  Appetizers
//
//  Created by lbr on 03/08/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
            loggerRemoteImage.info("\(NSString(string: urlString)) request to download image")
            NetworkManager.shared.downloadImage(fromURLString: urlString) { loadedImage in
                
                guard let loadedImage = loadedImage else {
                    loggerRemoteImage.error("Missing image")
                    return
                }
                
                loggerRemoteImage.info("\(NSString(string: urlString)) Image loaded")
                
                DispatchQueue.main.async {
                    self.image = Image(uiImage: loadedImage)
                }
            }
    }
}

struct RemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        ( imageLoader.image ?? Image("food-placeholder") )
        .resizable()
        .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(urlString: "http://localhost:8080/appetizers/images/fried-cheese-ravioli.jpeg")
            .scaledToFit()
    }
}

