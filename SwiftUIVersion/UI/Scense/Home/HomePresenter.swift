//
//  HomePresenter.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 19.01.2022.
//

import Foundation
import SwiftUI

final class HomePresenter: Presenter<HomeCoordinator> {
    
    @Published var movies: [Movie] = []
    var coreDataServing: CoreDataServing
    
    init(
        coordinator: HomeCoordinator,
        coreDataServing: CoreDataServing
    ) {
        self.coreDataServing = coreDataServing
        super.init(coordinator: coordinator)
    }
    
    func loadMovies() {
        guard let movies = coreDataServing.fetchObject(by: Movie.self) else {
            return
        }
        self.movies = movies
    }
    
    func goToDetail(_ isPresented: Binding<Bool>) -> some View {
        return coordinator?.goToDetail(isPresented)
    }
    
    func goToCreateNewMovies(_ isPresented: Binding<Bool>) -> some View {
        return coordinator?.goToCreateNewMovies(isPresented)
    }
    
}
