import XCTest

import FakerTests

var tests = [XCTestCaseEntry]()
tests += FakerTests.allTests()
XCTMain(tests)
