// Draft.no1Tests
// Created by Daniel Budyński 👾 on 23.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject
import XCTest
import UIKit
@testable
import Draft_no1

class EntrypointDispatcherTests: XCTestCase {

    var sut: EntryPointDispatcher!
    var fakeWindow: UIWindow!
    var fakeCoordinator: Coordinator!

    override func setUp() {
        super.setUp()
        fakeWindow = FakeWindow()
        fakeCoordinator = FakeCoordinator()
        sut = EntryPointDispatcherImp(coordinator: fakeCoordinator,
                                      window: fakeWindow)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_whenStartingApp_thenWindowRootIsSet() {
        // for
        let rootFlowController = FakeFlowController()
        fakeCoordinator.link(rootFlowController)

        //when
        sut.startApp()

        // then
        XCTAssertNotNil(fakeWindow.rootViewController)
        XCTAssertNotNil(fakeWindow.rootViewController === rootFlowController.rootViewController)
    }

    func test_whenStartingApp_thenWindowIsKey() {
        // for
        let rootFlowController = FakeFlowController()
        fakeCoordinator.link(rootFlowController)

        //when
        sut.startApp()

        // then
        XCTAssertTrue(fakeWindow.isKeyWindow)
    }
}
