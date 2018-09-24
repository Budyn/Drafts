// Draft.no1Tests
// Created by Daniel Budyński 👾 on 23.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Foundation
@testable
import Draft_no1

class FakeCoordinator: Coordinator {

    var rootFlow: FlowController?

    func link(_ flowController: FlowController) {
        if rootFlow == nil {
            rootFlow = flowController
        } else {
            rootFlow?.next = flowController
        }

        defer {
            flowController.coordinator = self
            flowController.start()
        }
    }

    func unlink(_ flowController: FlowController) {
        rootFlow?.next = nil
    }
    
}
