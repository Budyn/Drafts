// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

enum CoordinatorError: String, Error {

    case rootFlowControllerIsNil

}

protocol Coordinator: class {

    var rootFlow: FlowController? { get }

    func link(_ flowController: FlowController)

}

class AppCoordinator: Coordinator {

    var rootFlow: FlowController?

    func link(_ flow: FlowController) {
        if rootFlow == nil {
            set(rootFlow: flow)
            start(flow: flow)
            return
        }

        do {
            let lastFlow = try getLastFlow()
            link(flow, to: lastFlow)
        } catch {
            handle(error: error)
        }
    }

    private func set(rootFlow: FlowController) {
        rootFlow.coordinator = self
        self.rootFlow = rootFlow
    }

    private func link(_ linkedFlow: FlowController, to linkingFlow: FlowController) {
        linkingFlow.next = linkedFlow
        linkedFlow.coordinator = self
        start(flow: linkedFlow)
    }

    private func start(flow: FlowController) {
        flow.start()
    }

    private func getLastFlow() throws -> FlowController {
        guard let rootFlow = rootFlow else {
            throw CoordinatorError.rootFlowControllerIsNil
        }

        return try getLastFlow(from: rootFlow)
    }

    private func getLastFlow(from fromFlow: FlowController) throws -> FlowController {
        guard
            let nextFlow = fromFlow.next,
            nextFlow.rootViewController != nil
        else { return fromFlow }

        return try getLastFlow(from: nextFlow)
    }

    private func handle(error: Error) {
        guard
            let error = error as? CoordinatorError,
            let errorDescription = error.description
        else {
            print("Unrecognized Coordinator error")
            return
        }

        print(errorDescription)
    }

}
