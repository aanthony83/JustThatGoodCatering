//
//  ImageLoader.swift
//  JustThatGoodCatering
//
//  Created by aaron anthony on 1/14/21.
//

import Foundation
import Combine
import SwiftUI

/* Loading the Image Code */


class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

/* Async Loading of Image */

struct AsyncImage<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                //Change the Image Size
                Image(uiImage: loader.image!)
                    .resizable()
                    // .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 100)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            else {
                //                placeholder
                Image("bground")
                    .resizable()
                    // .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 100)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
        }
        
    }
}

struct AsyncImage2<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                //Change the Image Size  
                Image(uiImage: loader.image!)
                    .resizable()
                    // .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 250)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            else {
                //                placeholder
                Image("bground")
                    .resizable()
                    // .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 250)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
        }
        
    }
}
