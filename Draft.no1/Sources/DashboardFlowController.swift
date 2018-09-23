// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import UIKit

class DashboardFlowController {

    var coordinator: Coordinator!
    var next: FlowController?

    private var root: UIViewController?
    private let builder: DashboardBuilder!

    init(builder: DashboardBuilder) {
        self.builder = builder
    }

    func start() {
        let dashboardVC = builder.buildDashboardViewController()
        root = dashboardVC
    }

}
