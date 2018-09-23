// Draft.no1
// Created by Daniel Budyński 👾 on 30.08.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import UIKit

protocol FlowController: class {

    var rootView: UIViewController? { get }
    var coordinator: Coordinator? { get set }
    var next: FlowController? { get set }

    func start()

}
