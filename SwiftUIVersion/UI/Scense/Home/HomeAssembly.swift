//
//  HomeAssembly.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 27.09.2021.
//

import Swinject

final class HomeAssembly: AutoAssembly {

    dynamic func homeCoordinator() {
        container.register(
            HomeCoordinator.self
        ) { (resolver) -> HomeCoordinator in
            let coordinator = HomeCoordinator(resolver)
            return coordinator
        }
    }

    dynamic func homeController() {
        container.register(
            HomeView.self
        ) { (resolver, coordinator: HomeCoordinator) in
            let presenter = resolver.resolve(
                HomePresenter.self,
                argument: coordinator
            )!
            return HomeView(presenter: presenter)
        }
    }
    
    dynamic func homePresenter() {
        container.register(
            HomePresenter.self
        ) { (resolver, coordinator: HomeCoordinator) in
            let coreDataServing = resolver.resolve(CoreDataServing.self)!
            return HomePresenter(
                coordinator: coordinator,
                coreDataServing: coreDataServing
            )
        }
    }

}
