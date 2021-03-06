// Draft.no1Tests
// Created by Daniel Budyński 👾 on 24.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject
import XCTest
@testable
import Draft_no1

class FlowControllerAssemblyTests: XCTestCase {

    var sut: DependencyContainer!

    override func setUp() {
        super.setUp()
        sut = DependencyContainerImp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_resolving_appCoordinator() {
        XCTAssertNotNil(sut.resolve(Coordinator.self))
    }

    func test_resolving_dashboardFlowController() {
        XCTAssertNotNil(sut.resolve(DashboardFlowController.self))
    }

}
