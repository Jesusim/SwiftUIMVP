//
//  HomePresenter.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 19.01.2022.
//

import Foundation
import SwiftUI

final class HomePresenter: Presenter<HomeCoordinator> {
    
    @Published var message: String = ""
    
    func showText() {
        message = "Hello man"
    }
    
    func goToDetail(_ isPresented: Binding<Bool>) -> some View {
        return coordinator.goToDetail(isPresented)
    }
    
}
