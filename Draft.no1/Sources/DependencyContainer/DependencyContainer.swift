// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject

protocol DependencyContainer {

    var resolver: Resolver { get }

}

class DependencyContainerImp: DependencyContainer {

    var resolver: Resolver {
        return assembler.resolver
    }

    private lazy var assembler: Assembler = {
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
