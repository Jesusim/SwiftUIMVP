//
//  CreateNewMoviesCoordinator.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 07.02.2022.
//

import Foundation

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
    
}
