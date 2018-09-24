// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import UIKit
import Swinject

class UtilityAssembly: Assembly {

    func assemble(container: Container) {
        container.register(EntryPointDispatcher.self) { res in
            EntryPointDispatcherImp(coordinator: res.resolve(Coordinator.self)!,
                                    builder: res.resolve(EntryPointBuilder.self)!)
        }
    }

}
