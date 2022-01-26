//
//  AppStartMode.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 21.01.2022.
//

import SwiftUI

@main
struct AppStartMode: App {
    
    private let configurator: SwinjectConfigurating
    private let coordinator: AppCoordinator
    
    init() {
        self.configurator = SwinjectConfigurator.shared
        self.coordinator = configurator.resolver.resolve(AppCoordinator.self)!
    }

    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
