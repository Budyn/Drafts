// Draft.no1Tests
// Created by Daniel Budyński 👾 on 24.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Foundation
@testable
import Draft_no1

class FakeEntryPointBuilder: EntryPointBuilder {

    func buildDashboardFlowController() -> FlowController {
        return FakeFlowController()
    }

}
