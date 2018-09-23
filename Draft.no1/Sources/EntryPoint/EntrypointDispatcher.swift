// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import UIKit

protocol EntryPointDispatcher {

    func startApp()

}

class EntryPointDispatcherImp: EntryPointDispatcher {

    private let coordinator: Coordinator
    private let window: UIWindow

    init(coordinator: Coordinator, window: UIWindow) {
        self.coordinator = coordinator
        self.window = window
    }

    func startApp() {
        let vc = UIViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }

}
