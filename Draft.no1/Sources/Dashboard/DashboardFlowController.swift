// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import UIKit

class DashboardFlowController: FlowController {

    var rootViewController: UIViewController?
    var coordinator: Coordinator?
    var next: FlowController?

    private let window = UIWindow(frame: UIScreen.main.bounds)
    private let builder: DashboardBuilder!

    init(builder: DashboardBuilder) {
        self.builder = builder
    }

    func start() {
        let dashboardVC = builder.buildDashboardViewController()
        rootViewController = dashboardVC
        window.rootViewController = dashboardVC
        window.makeKeyAndVisible()
    }

}
