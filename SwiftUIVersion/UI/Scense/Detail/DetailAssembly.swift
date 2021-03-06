//
//  DetailAssembly.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 20.01.2022.
//

import Swinject
import SwiftUI

final class DetailAssembly: AutoAssembly {
    
    dynamic func homeCoordinator() {
        container.register(
            DetailCoordinator.self
        ) { (resolver) -> DetailCoordinator in
            let coordinator = DetailCoordinator(resolver)
            return coordinator
        }
    }
    
    dynamic func homeController() {
        container.register(
            DetailView.self
        ) { (resolver) in
            return DetailView()
        }
    }
    
}
