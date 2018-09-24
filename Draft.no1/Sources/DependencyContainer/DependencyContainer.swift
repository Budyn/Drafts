// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject

protocol DependencyContainer {

    var assembler: Assembler { get }

    func resolve<T>(_ type: T.Type) -> T?

}

extension DependencyContainer {

    func resolve<T>(_ type: T.Type) -> T? {
        return assembler.resolver.resolve(type)
    }

}

class DependencyContainerImp: DependencyContainer {

    lazy var assembler: Assembler = {
        return Assembler([
            ViewModelAssembly(),
            ViewControllerAssembly(),
            FlowControllerAssembly(),
            BuilderAssembly(),
            ServiceAssembly(),
            UtilityAssembly()
        ])
    }()

}
