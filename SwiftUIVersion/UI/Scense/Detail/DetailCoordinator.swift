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
        return .parent
    }

    override func instantiateViewController() -> DetailView {
        return resolver.resolve(
            DetailView.self
        )!
    }
    
}
