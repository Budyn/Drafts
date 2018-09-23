// Draft.no1Tests
// Created by Daniel Budyński 👾 on 23.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Foundation
import UIKit
@testable
import Draft_no1

class FakeFlowController: FlowController {

    var isStarted: Bool = false

    var rootView: UIViewController?
    var coordinator: Coordinator?
    var next: FlowController?

    func start() {
        rootView = UIViewController()
        isStarted = true
    }

}
