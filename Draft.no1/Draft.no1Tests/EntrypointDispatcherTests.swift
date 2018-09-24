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
    var fakeEntryPointBuilder: EntryPointBuilder!
    var fakeCoordinator: Coordinator!

    override func setUp() {
        super.setUp()
        fakeEntryPointBuilder = FakeEntryPointBuilder()
        fakeCoordinator = FakeCoordinator()
        sut = EntryPointDispatcherImp(coordinator: fakeCoordinator,
                                      builder: fakeEntryPointBuilder)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}
