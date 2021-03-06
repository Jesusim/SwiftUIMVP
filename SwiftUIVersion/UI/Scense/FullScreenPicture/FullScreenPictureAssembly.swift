//
//  FullScreenPictureAssembly.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 07.02.2022.
//

import Foundation
import SwiftUI

final class FullScreenPictureAssembly: AutoAssembly {
    
    dynamic func fullScreenPictureCoordinator() {
        container.register(
            FullScreenPictureCoordinator.self
        ) { (resolver) -> FullScreenPictureCoordinator in
            let coordinator = FullScreenPictureCoordinator(resolver)
            return coordinator
        }
    }
    
    dynamic func fullScreenPictureController() {
        container.register(
            FullScreenPicture.self
        ) { (resolver, coordinator: FullScreenPictureCoordinator, image: Binding<UIImage?>) in
            return FullScreenPicture(image: image)
        }
    }
    
}
