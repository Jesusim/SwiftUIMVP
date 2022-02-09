//
//  HomeCoordinator.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 27.09.2021.
//

import Foundation
import Swinject
import SwiftUI

final class HomeCoordinator: Coordinator<HomeView> {
    
    override func instantiateViewController() -> HomeView {
        return resolver.resolve(
            HomeView.self,
            argument: self
        )!
    }
    
    func goToDetail(_ isPresented: Binding<Bool>) -> some View {
        let detailCoord = resolver.resolve(
            DetailCoordinator.self,
            argument: isPresented
        )!
        return coordinate(to: detailCoord)
    }
    
    func goToCreateNewMovies(_ isPresented: Binding<Bool>) -> some View {
        let newMovies = resolver.resolve(
            CreateNewMoviesCoordinator.self,
            argument: isPresented
        )!
        return coordinate(to: newMovies)
    }
    
    deinit {
        print("\(identifier) deinit HomeCoordinator")
    }
    
}
