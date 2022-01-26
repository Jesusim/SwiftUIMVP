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
        ) { (resolver, isPresented: Binding<Bool>) -> DetailCoordinator in
            let coordinator = DetailCoordinator(resolver, isPresented: isPresented)
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
