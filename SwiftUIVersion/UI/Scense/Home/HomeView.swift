//
//  HomeView.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 23.09.2021.
//

import SwiftUI
import Swinject

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter

    init(
        presenter: HomePresenter
    ) {
        self.presenter = presenter
    }
    
    var body: some View {
        List {
            ForEach(presenter.movies) { item in
                NavigationButton(
                    contentView: Text(item.name)
                ) { isPresented in
                    presenter.goToDetail(isPresented)
                }.foregroundColor(.red)
            }
        }.navigationBarTitle("Movies list").toolbar {
            NavigationButton(
                contentView: Label("Add movie", systemImage: "square.and.pencil")
            ) { isPresented in
                presenter.goToCreateNewMovies(isPresented)
            }
        }
    }
}
