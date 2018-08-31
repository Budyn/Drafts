// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

protocol Coordinator {

    func link(_ flowController: FlowController)

}

class AppCoordinator: Coordinator {

    var root: FlowController?

    func link(_ flowController: FlowController) {
        set(root: flowController)
        flowController.start()
    }

    private func set(root rootFlowController: FlowController) {
        self.root = rootFlowController
    }

}
