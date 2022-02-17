//
//  DetailCoordinator.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 21.01.2022.
//

import Foundation
import Swinject
import SwiftUI

final class DetailCoordinator: Coordinator<DetailView> {
    
    override var presentationStyle: NavigationStyle {
        return .nextView
    }

    override func instantiateView() -> DetailView {
        return resolver.resolve(
            DetailView.self
        )!
    }
    
}
