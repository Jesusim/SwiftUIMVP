//
//  CreateNewMoviesCoordinator.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 07.02.2022.
//

import Foundation
import SwiftUI

final class CreateNewMoviesCoordinator: Coordinator<CreateNewMoviesView> {
    
    override var presentationStyle: NavigationStyle {
        return .nextView
    }

    override func instantiateView() -> CreateNewMoviesView {
        return resolver.resolve(
            CreateNewMoviesView.self,
            argument: self
        )!
    }
    
    var fullScreenPictureCoordinator: FullScreenPictureCoordinator!
    
    override func instantiateChildrenCoordinate() {
        fullScreenPictureCoordinator = resolver.resolve(
            FullScreenPictureCoordinator.self
        )!
    }
    
    func openImageForFullScreen(_ isPresented: Binding<Bool>, image: Binding<UIImage?>) -> some View {
        fullScreenPictureCoordinator.isPresented = isPresented
        fullScreenPictureCoordinator.image = image
        return coordinate(to: fullScreenPictureCoordinator)
    }
    
}
