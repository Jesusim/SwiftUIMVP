//
//  HomeView.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 23.09.2021.
//

import SwiftUI
import Swinject

struct HomeView: View {
    
    @ObservedObject var presentr: HomePresenter

    init(
        presentr: HomePresenter
    ) {
        self.presentr = presentr
    }
    
    var body: some View {
        List {
            ForEach(presentr.movies) { item in
                Text(item.name)
            }
        }.navigationBarTitle("Movies list").toolbar {
            NavigationButton(contentView: Label("Add movie", systemImage: "square.and.pencil")) { isPresented in
                presentr.goToDetail(isPresented)
            }
        }
    }
}
