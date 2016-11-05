/*
 * Copyright 2016-present Facebook, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License. You may obtain
 * a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

import XCTest
import MixedDependency1

class test_withInterop: XCTestCase {
  func testEcho() {
    XCTAssertEqual("echo", "echo", "Pass")
  }

  func testAnswer() {
    XCTAssertEqual(MD1TestClass2.answer(), "MD1TestClass2");
  }

  func testSwift() {
    let foo = Foo()
    XCTAssertNotNil(foo)
  }

  func testBridgingHeader() {
    let test2 = MD1TestClass2()
    XCTAssertNotNil(test2)
  }

  func testModule() {
    let test = MD1TestClass()
    XCTAssertNotNil(test)
  }
}
