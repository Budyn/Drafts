// Draft.no1
// Created by Daniel Budyński 👾 on 24.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject

protocol EntryPointBuilder {

    func buildDashboardFlowController() -> FlowController

}

class EntryPointBuilderImp: EntryPointBuilder {

    private let dependencyResolver: Resolver

    init(dependencyResolver: Resolver) {
        self.dependencyResolver = dependencyResolver
    }

    func buildDashboardFlowController() -> FlowController {
        return dependencyResolver.resolve(DashboardFlowController.self)!
    }

}
