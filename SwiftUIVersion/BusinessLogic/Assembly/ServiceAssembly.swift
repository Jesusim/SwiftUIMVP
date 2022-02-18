//
//  ServiceAssembly.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 18.02.2022.
//

import Foundation

import Swinject

final class ServiceAssembly: AutoAssembly {
    
    dynamic func coreDataService() {
        container.register(CoreDataServing.self) { resolver in
            return CoreDataService()
        }
    }
    
}
