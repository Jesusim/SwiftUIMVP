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
    
    override func instantiateView() -> HomeView {
        return resolver.resolve(
            HomeView.self,
            argument: self
        )!
    }
    
    var detailCoordinator: DetailCoordinator!
    var createNewMoviesCoordinator: CreateNewMoviesCoordinator!
    
    override func instantiateChildrenCoordinate() {
        createNewMoviesCoordinator = resolver.resolve(
            CreateNewMoviesCoordinator.self
        )!
        
        detailCoordinator = resolver.resolve(
            DetailCoordinator.self
        )!
    }
    
    func goToCreateNewMovies(_ isPresented: Binding<Bool>) -> some View {
        createNewMoviesCoordinator?.isPresented = isPresented
        return coordinate(to: createNewMoviesCoordinator)
    }
    
    func goToDetail(_ isPresented: Binding<Bool>) -> some View {
        detailCoordinator.isPresented = isPresented
        return coordinate(to: detailCoordinator)
    }
    
}
