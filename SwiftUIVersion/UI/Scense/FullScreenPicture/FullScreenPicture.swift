//
//  FullScreenPicture.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 07.02.2022.
//

import SwiftUI

struct FullScreenPicture: View {
    
    var image: Binding<UIImage?> = .constant(UIImage(named: "no_image")!)
    
    init(image: Binding<UIImage?>) {
        self.image = image
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image.wrappedValue!)
                .resizable()
        }
    }
}
