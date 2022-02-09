//
//  AppCoordinator.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 19.01.2022.
//

import Foundation
import Swinject
import SwiftUI

protocol AppCordinating {
    associatedtype V: View
    func start() -> V
}

final class AppCoordinator: Coordinating, AppCordinating {
    
    typealias P = AppCoordinator
    
    /// Резольвер контейнера Swinject.
    let resolver: Resolver

    init(_ resolver: Resolver) {
        self.resolver = resolver
    }
    
    func start() -> some View {
        return runHomeView()
    }
    
    func runHomeView() -> some View {
        let homeView = resolver.resolve(
            HomeCoordinator.self
        )!
        return coordinate(to: homeView)
    }
    
}
