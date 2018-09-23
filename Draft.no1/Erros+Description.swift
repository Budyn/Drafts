// RoamFoundation
// Created by Daniel Budyński 👾 on 05.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Prismake. All rights reserved.

import Foundation

extension Error where Self: RawRepresentable, Self.RawValue == String {

    var description: String? {
        guard let decomposingRegex = try? NSRegularExpression(pattern: decomposingRegex) else {
            return nil
        }

        let decomposingRange = NSRange(location: 0, length: rawValue.count)
        let decomposed = decomposingRegex.stringByReplacingMatches(in: rawValue,
                                                                   range: decomposingRange,
                                                                   withTemplate: decomposingTemplate)
        return format(string: decomposed)
    }

    private func format(string: String) -> String? {
        guard let firstChar = string.first else { return nil }
        return String(firstChar).capitalized + string.dropFirst().lowercased()
    }

    private var decomposingRegex: String {
        return "([a-z])([A-Z])"
    }

    private var decomposingTemplate: String {
        return "$1 $2"
    }

}
