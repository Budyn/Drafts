// Draft.no1Tests
// Created by Daniel Budyński 👾 on 23.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import Foundation
import UIKit

class FakeWindow: UIWindow {

    init() {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
