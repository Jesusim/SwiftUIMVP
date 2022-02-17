//
//  Coordinator.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 27.09.2021.
//

import Foundation
import Swinject
import SwiftUI

private var identifierKey: UInt8 = 0
private var childrenKey: UInt8 = 0
private var parentKey: UInt8 = 0

protocol BaseCoordinator: AssociatedObject {
    func stop()
}

extension BaseCoordinator {
    fileprivate(set) var identifier: UUID {
        get {
            guard let identifier: UUID = associatedObject(for: &identifierKey) else {
                self.identifier = UUID()
                return self.identifier
            }
            return identifier
        }
        set { setAssociatedObject(newValue, for: &identifierKey) }
    }
    
    fileprivate(set) var children: [UUID: BaseCoordinator] {
        get {
            guard let children: [UUID: BaseCoordinator] = associatedObject(for: &childrenKey) else {
                self.children = [UUID: BaseCoordinator]()
                return self.children
            }
            return children
        }
        set { setAssociatedObject(newValue, for: &childrenKey) }
    }
    
    fileprivate func store<T: Coordinating>(child coordinator: T) {
        children[coordinator.identifier] = coordinator
    }
    
    fileprivate func free<T: Coordinating>(child coordinator: T) {
        children.removeValue(forKey: coordinator.identifier)
    }
}

protocol Coordinating: BaseCoordinator {
    associatedtype V: View
    associatedtype P: Coordinating
    func start() -> V
}

extension Coordinating {
    private(set) weak var parent: P? {
        get { associatedObject(for: &childrenKey) }
        set { setAssociatedObject(newValue, for: &childrenKey, policy: .weak) }
    }
    
    func coordinate<T: Coordinating>(to coordinator: T) -> some View {
        store(child: coordinator)
        coordinator.parent = self as? T.P
        return coordinator.start()
    }
    
    func stop() {
        children.removeAll()
        parent?.free(child: self)
    }
}

class Coordinator<V: View>: Coordinating {
    
    typealias P = Coordinator
    
    /// Стиль презентации модуля.
    enum NavigationStyle {
        
        case modalView
        
        case nextView
        
        case parent
    }
    
    var presentationStyle: NavigationStyle {
        return .parent
    }
    
    var isPresented: Binding<Bool>? = nil
    
    /// Резольвер контейнера Swinject.
    let resolver: Resolver
    
    init(
        _ resolver: Resolver
    ) {
        self.resolver = resolver
        instantiateChildrenCoordinate()
    }
    
    init(
        _ resolver: Resolver,
        isPresented: Binding<Bool>
    ) {
        self.resolver = resolver
        self.isPresented = isPresented
        instantiateChildrenCoordinate()
    }
    
    @discardableResult
    @ViewBuilder
    func start() -> some View {
        if let isPresented = isPresented {
            switch presentationStyle {
            case .nextView, .parent:
                NavigationLinkWrapper(destination: loadInstantiateView(), isPresented: isPresented)
            case .modalView:
                ModalLinkWrapper(destination: loadInstantiateView(), isPresented: isPresented)
            }
        } else {
            NavigationView { loadInstantiateView() }
        }
    }
    
    func loadInstantiateView() -> some View  {
        return instantiateView()
            .onAppear {
                self.onAppear()
            }
            .onDisappear {
                self.onDisappear()
                self.stop()
            }
    }
    
    func instantiateView() -> V {
        preconditionFailure("Необходимо переопределить эту функции в наследнике!")
    }
    
    func instantiateChildrenCoordinate() {}
    
    func onAppear() {}
    
    func onDisappear() {}
    
}
