// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject

class FlowControllerAssembly: Assembly {

    func assemble(container: Container) {
        container.register(DashboardFlowController.self) { res in
            DashboardFlowController(builder: res.resolve(DashboardBuilder.self)!)
        }
    }

}
