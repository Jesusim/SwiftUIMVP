//
//  CreateNewMoviesAssembly.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 02.02.2022.
//

import Foundation
import SwiftUI

final class CreateNewMoviesAssembly: AutoAssembly {
    
    dynamic func homeCoordinator() {
        container.register(
            CreateNewMoviesCoordinator.self
        ) { (resolver, isPresented: Binding<Bool>) -> CreateNewMoviesCoordinator in
            let coordinator = CreateNewMoviesCoordinator(resolver, isPresented: isPresented)
            return coordinator
        }
    }
    
    dynamic func homeController() {
        container.register(
            CreateNewMoviesView.self
        ) { (resolver) in
            return CreateNewMoviesView()
        }
    }
    
}
