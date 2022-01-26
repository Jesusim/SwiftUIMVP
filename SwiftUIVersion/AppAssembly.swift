//
//  AppAssembly.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 19.01.2022.
//

import Foundation

final class AppAssembly: AutoAssembly {
    dynamic func appCoordinator() {
        container.register(AppCoordinator.self) { (resovler) -> AppCoordinator in
            return AppCoordinator(
                resovler
            )
        }.inObjectScope(.container)
    }
}
