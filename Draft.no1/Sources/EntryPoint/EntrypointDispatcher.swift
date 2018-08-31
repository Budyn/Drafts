// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import UIKit

protocol EntryPointDispatcher {

    func startApp()

}

class EntryPointDispatcherImp: EntryPointDispatcher {

    private lazy var coordinator: Coordinator = {
        return AppCoordinator()
    }()

    private lazy var window: UIWindow = {
        return UIWindow(frame: UIScreen.main.bounds)
    }()

    func startApp() {
        let vc = UIViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }

}
