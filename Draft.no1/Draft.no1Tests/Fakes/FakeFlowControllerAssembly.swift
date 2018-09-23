// Draft.no1Tests
// Created by Daniel Budyński 👾 on 23.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject
@testable
import Draft_no1

class FakeFlowControllerAssembly: Assembly {

    func assemble(container: Container) {
        container.register(Coordinator.self) { _ in
            FakeCoordinator()
        }
    }

}
