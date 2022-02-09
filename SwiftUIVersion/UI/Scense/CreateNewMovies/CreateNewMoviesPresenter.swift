//
//  CreateNewMoviesPresenter.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 07.02.2022.
//

import Foundation
import SwiftUI

final class CreateNewMoviesPresenter: Presenter<CreateNewMoviesCoordinator> {
    
    @Published var title: String = ""
    @Published var description: String = ""
    
    func openImageForFullScreen(_ isPresented: Binding<Bool>, image: Binding<UIImage?>) -> some View {
        coordinator?.openImageForFullScreen(isPresented, image: image)
    }
    
}
