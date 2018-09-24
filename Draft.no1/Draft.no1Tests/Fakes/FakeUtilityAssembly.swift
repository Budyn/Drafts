// Draft.no1Tests
// Created by Daniel Budyński 👾 on 24.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Swinject
import UIKit

class FakeUtilityAssembly: Assembly {

    func assemble(container: Container) {
        container.register(UIWindow.self) { _ in
            FakeWindow()
        }
    }

}
