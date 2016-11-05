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

#import <XCTest/XCTest.h>
#import <MixedDependency1/MixedDep1.h>

@interface FooXCTest : XCTestCase
@end

@implementation FooXCTest

- (void)testTwoPlusTwoEqualsFour {
  XCTAssertEqual(2 + 2, 4, @"Two plus two equals four");
}

- (void)testTestClassAnswer {
  XCTAssertEqualObjects([MD1TestClass answer], @"MD1TestClass");
}

- (void)testTestClass2Answer {
  XCTAssertEqualObjects([MD1TestClass2 answer], @"MD1TestClass2");
}

- (void)testFooBar {
  XCTAssertEqualObjects([MD1TestClass fooBar], @"Foo.bar");
}

// - (void)testFoo {
//   XCTAssertNotNil([Foo new]);
// }

@end
