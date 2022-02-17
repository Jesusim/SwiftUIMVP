//
//  Presenter.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 26.01.2022.
//

import Foundation
import SwiftUI

class Presenter<C: Coordinating>: ObservableObject {
    private(set) weak var coordinator: C?
    
    init(coordinator: C) {
        self.coordinator = coordinator
    }
    
    deinit {
        coordinator?.stop()
    }
}
