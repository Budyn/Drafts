// Draft.no1Tests
// Created by Daniel Budyński 👾 on 23.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import XCTest
@testable
import Draft_no1

class AppCoordinatorTests: XCTestCase {

    var sut: Coordinator!

    override func setUp() {
        super.setUp()
        sut = AppCoordinator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_whenLinkingFirstFlow_thenRootIsSet() {
        // For
        let fakeflowController = FakeFlowController()

        // When
        sut.link(fakeflowController)

        // Then
        XCTAssertNotNil(sut.rootFlow)
        XCTAssertTrue(sut.rootFlow! === fakeflowController)
    }

    func test_whenLinkingNextFlow_thenNextFlowCoordinatorIsSet() {
        // For
        let fakeflowController = FakeFlowController()

        // When
        sut.link(fakeflowController)

        // Then
        XCTAssertNotNil(fakeflowController.coordinator)
        XCTAssertTrue(fakeflowController.coordinator! === sut)
    }

    func test_whenLinkingNextFlow_thenPreviousFlowNextFlowIsSet() {
        // For
        let fakeRootFlowController = FakeFlowController()
        let fakeNextFlowController = FakeFlowController()

        // When
        sut.link(fakeRootFlowController)
        sut.link(fakeNextFlowController)

        // Then
        XCTAssertTrue(fakeNextFlowController.coordinator! === sut)
        XCTAssertTrue(fakeRootFlowController.next! === fakeNextFlowController)
    }

    func test_whenLinkingNextFlow_thenLinkedFlowStarted() {
        // For
        let fakeFlowController = FakeFlowController()

        // When
        sut.link(fakeFlowController)

        // Then
        XCTAssertTrue(fakeFlowController.isStarted)
    }

    func test_whenUnLinkingLastLinkedFlow_thenPreviousFlowNextIsNil() {
        // For
        let rootFakeFlowController = FakeFlowController()
        let lastFakeFlowController = FakeFlowController()

        sut.link(rootFakeFlowController)
        sut.link(lastFakeFlowController)

        // When
        sut.unlink(lastFakeFlowController)

        // Then
        XCTAssertNotNil(rootFakeFlowController)
        XCTAssertNil(rootFakeFlowController.next)
        XCTAssertTrue(sut.rootFlow === rootFakeFlowController)
    }

    func test_whenUnLinkingRootFlow_thenLastFlowIsNewRoot() {
        // For
        let rootFakeFlowController = FakeFlowController()
        let lastFakeFlowController = FakeFlowController()

        // When
        sut.link(rootFakeFlowController)
        sut.link(lastFakeFlowController)

        XCTAssertTrue(sut.rootFlow === rootFakeFlowController)
        XCTAssertTrue(sut.rootFlow!.next! === lastFakeFlowController)
        XCTAssertNil(sut.rootFlow!.next!.next)

        sut.unlink(rootFakeFlowController)

        // Then
        XCTAssertNil(lastFakeFlowController.next)
        XCTAssertTrue(sut.rootFlow === lastFakeFlowController)
    }

    func test_whenUnLinkingRootFlow_IfThereIsNoNextFlow_thenDoNothing() {
        // For
        let rootFakeFlowController = FakeFlowController()

        // When
        sut.link(rootFakeFlowController)

        XCTAssertTrue(sut.rootFlow === rootFakeFlowController)
        XCTAssertNil(sut.rootFlow!.next)

        sut.unlink(rootFakeFlowController)

        // Then
        XCTAssertTrue(sut.rootFlow === rootFakeFlowController)
    }

    func test_whenUnLinkingMiddleFlow_thenNextFromMidleFlowShouldBeAssigned_asNextOfPreviousFlow() {
        // For
        let rootFakeFlowController = FakeFlowController()
        let middleFakeFlowController = FakeFlowController()
        let lastFakeFlowController = FakeFlowController()

        // When
        sut.link(rootFakeFlowController)
        sut.link(middleFakeFlowController)
        sut.link(lastFakeFlowController)

        XCTAssertTrue(sut.rootFlow === rootFakeFlowController)
        XCTAssertTrue(sut.rootFlow!.next! === middleFakeFlowController)
        XCTAssertTrue(sut.rootFlow!.next!.next! === lastFakeFlowController)
        XCTAssertNil(sut.rootFlow!.next!.next!.next)

        sut.unlink(middleFakeFlowController)

        // Then
        XCTAssertTrue(sut.rootFlow === rootFakeFlowController)
        XCTAssertTrue(sut.rootFlow!.next! === lastFakeFlowController)
        XCTAssertNil(sut.rootFlow!.next!.next)
    }


}
