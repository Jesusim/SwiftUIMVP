//
//  HomePresenter.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 19.01.2022.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id: String = UUID().uuidString
    var name: String
}

final class HomePresenter: Presenter<HomeCoordinator> {
    
    @Published var message: String = ""
    @Published var movies: [Movie] = [Movie(name: "Master")]
    
    func goToDetail(_ isPresented: Binding<Bool>) -> some View {
        return coordinator.goToDetail(isPresented)
    }
    
}
