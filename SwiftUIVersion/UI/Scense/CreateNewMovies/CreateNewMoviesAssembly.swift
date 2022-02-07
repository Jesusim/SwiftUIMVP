//
//  CreateNewMoviesAssembly.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 02.02.2022.
//

import Foundation
import SwiftUI

final class CreateNewMoviesAssembly: AutoAssembly {
    
    dynamic func createNewMoviesCoordinator() {
        container.register(
            CreateNewMoviesCoordinator.self
        ) { (resolver, isPresented: Binding<Bool>) -> CreateNewMoviesCoordinator in
            let coordinator = CreateNewMoviesCoordinator(resolver, isPresented: isPresented)
            return coordinator
        }
    }
    
    dynamic func createNewMoviesController() {
        container.register(
            CreateNewMoviesView.self
        ) { (resolver, coordinator: CreateNewMoviesCoordinator) in
            let presenter = resolver.resolve(
                CreateNewMoviesPresenter.self,
                argument: coordinator
            )!
            return CreateNewMoviesView(presenter: presenter)
        }
    }
    
    dynamic func createNewMoviesPresenter() {
        container.register(
            CreateNewMoviesPresenter.self
        ) { (resolver, coordinator: CreateNewMoviesCoordinator) in
            return CreateNewMoviesPresenter(coordinator: coordinator)
        }
    }
    
}
