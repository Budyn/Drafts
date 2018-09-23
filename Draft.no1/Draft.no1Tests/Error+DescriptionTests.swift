// Draft.no1Tests
// Created by Daniel Budyński 👾 on 24.09.2018
// MacOS 10.13, Swift 4.0
// Copyright © 2018 Budyn And Friends. All rights reserved.

import XCTest
@testable
import Draft_no1

class Error_DescriptionTests: XCTestCase {

    enum FakeError: String, Error {

        case thisIsFakeButCorrectFormatErrorMessage
        case thisisfakeandInc1orrectFormatErrorMessage
        case this_is_also_incorrect_formatErrorMessage

        var testDesc: String {
            switch self {
            case .thisIsFakeButCorrectFormatErrorMessage:
                return "This is fake but correct format error message"
            case .this_is_also_incorrect_formatErrorMessage:
                return "This is also incorrect format error message"
            case .thisisfakeandInc1orrectFormatErrorMessage:
                return "This is fake and incorrect format error message"
            }
        }

    }

    func test_correctFormatError() {
        // For
        let sut = FakeError.thisIsFakeButCorrectFormatErrorMessage

        // Then
        XCTAssertNotNil(sut.description)
        XCTAssertEqual(sut.description!, sut.testDesc)
    }

    func test_incorrectFormatError() {
        // For
        let sut1 = FakeError.thisisfakeandInc1orrectFormatErrorMessage

        // Then
        XCTAssertNotNil(sut1.description)
        XCTAssertNotEqual(sut1.description!, sut1.testDesc)

        // For
        let sut2 = FakeError.this_is_also_incorrect_formatErrorMessage

        // Then
        XCTAssertNotNil(sut2.description)
        XCTAssertNotEqual(sut2.description!, sut2.testDesc)
    }

}
