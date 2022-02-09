//
//  FullScreenPicture.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 07.02.2022.
//

import SwiftUI

struct FullScreenPicture: View {
    
    var presenter: FullScreenPicturePresenter
    var image: Binding<UIImage?> = .constant(UIImage(named: "no_image")!)
    
    init(presenter: FullScreenPicturePresenter, image: Binding<UIImage?>) {
        self.presenter = presenter
        self.image = image
    }
    
    var body: some View {
        VStack {
            Text("Image")
            Image(uiImage: image.wrappedValue!)
                .resizable()
        }
    }
}
