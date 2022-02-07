//
//  CreateNewMoviesView.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 02.02.2022.
//

import SwiftUI

struct CreateNewMoviesView: View {
    
    @ObservedObject var presenter: CreateNewMoviesPresenter

    init(
        presenter: CreateNewMoviesPresenter
    ) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Movie title:")
                TextField("Put here title", text: $presenter.title)
                    .padding([.top, .bottom, .trailing], 8)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 5)
        }.navigationTitle("Create movies")
    }
}
