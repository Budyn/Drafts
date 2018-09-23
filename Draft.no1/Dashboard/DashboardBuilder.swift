// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject
import UIKit

protocol DashboardBuilder {

    func buildDashboardViewController() -> UIViewController

}

class DashboardBuilderImp: DashboardBuilder {

    private let dependencyResolver: Resolver

    init(dependencyResolver: Resolver) {
        self.dependencyResolver = dependencyResolver
    }

    func buildDashboardViewController() -> UIViewController {
        let vc = dependencyResolver.resolve(DashboardViewController.self)!
        return vc
    }

}
