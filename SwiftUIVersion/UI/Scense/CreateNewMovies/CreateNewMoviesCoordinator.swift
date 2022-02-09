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

    override func instantiateViewController() -> CreateNewMoviesView {
        return resolver.resolve(
            CreateNewMoviesView.self,
            argument: self
        )!
    }
    
    func openImageForFullScreen(_ isPresented: Binding<Bool>, image: Binding<UIImage?>) -> some View {
        let child = resolver.resolve(
            FullScreenPictureCoordinator.self,
            arguments: isPresented,
            image
        )!
        return coordinate(to: child)
    }
    
    deinit {
        print("\(identifier) deinit CreateNewMoviesCoordinator")
    }
    
}
