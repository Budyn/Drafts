// Draft.no1Tests
// Created by Daniel Budyński 👾 on 23.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject
@testable
import Draft_no1

class FakeDependencyContainer: DependencyContainer {

    var resolver: Resolver {
        return assembler.resolver
    }

    private lazy var assembler: Assembler = {
        return Assembler([FakeFlowControllerAssembly(),
                          FakeUtilityAssembly()])
    }()


}
