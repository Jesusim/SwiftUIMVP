//
//  FullScreenPictureCoordinator.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 07.02.2022.
//

import Foundation
import SwiftUI

final class FullScreenPictureCoordinator: Coordinator<FullScreenPicture> {
    
    var image: Binding<UIImage?> = .constant(nil)
    
    override var presentationStyle: NavigationStyle {
        return .nextView
    }

    override func instantiateViewController() -> FullScreenPicture {
        return resolver.resolve(
            FullScreenPicture.self,
            arguments: self,
            image
        )!
    }
    
    deinit {
        print("\(identifier) deinit FullScreenPictureCoordinator")
    }
    
}
