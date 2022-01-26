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
        VStack {
            Text(presentr.message)
            Button {
                presentr.showText()
            } label: {
                Text("Show Text")
            }
            NavigationButton(contentView: Text("Go Detail Red")) { isPresented in
                presentr.goToDetail(isPresented)
            }
        }
    }
}
