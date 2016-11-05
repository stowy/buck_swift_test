### Test modules functionality with Interop

This branch must be tested against the branch referenced in [this PR](https://github.com/facebook/buck/pull/983) - [found here](https://github.com/nguyentruongtho/buck/tree/tho/import_modules)

To test, run `buck test MixedDependencyTests/MixedDependency1`

This will run the tests found below.

### Results
- testSwift() tests a swift class in the newly created `MixedDependency1` module. This works as expected. 
- testBridgingHeader() tests an objc class included in the bridging header for the same module. This also works.
- testModule() tests an objc class from the same module, that is not included in the bridging header. This fails.

- unable to build and @import MixedDependency1 in objC tests file `DummyTest.m` to access swift class 'Foo' in ObjC
- additionally, if we enable the `-fmodules` cxx flag in the buck config, we get the following errors:

```
$ ubuck test MixedDependencyTests/MixedDependency1
Not using buckd because watchman isn't installed.
MixedDependencyTests/MixedDependency1/Tests/DummyTest.m:17:9: fatal error: module 'XCTest' not found
@import XCTest; /* clang -E: implicit import for "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Frameworks/XCTest.framework/Headers/XCTest.h" */
 ~~~~~~~^~~~~~
1 error generated.

In file included from MixedDependencyTests/MixedDependency1/Classes/MD1TestClass.m:1:
MixedDependencyTests/MixedDependency1/Classes/MD1TestClass.h:1:9: fatal error: module 'Foundation' not found
@import Foundation; /* clang -E: implicit import for "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/Foundation.framework/Headers/Foundation.h" */
 ~~~~~~~^~~~~~~~~~
1 error generated.

In file included from MixedDependencyTests/MixedDependency1/Classes/MD1TestClass2.m:1:
MixedDependencyTests/MixedDependency1/Classes/MD1TestClass2.h:1:9: fatal error: module 'Foundation' not found
@import Foundation; /* clang -E: implicit import for "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks/Foundation.framework/Headers/Foundation.h" */
 ~~~~~~~^~~~~~~~~~
1 error generated.

BUILD FAILED: //MixedDependencyTests/MixedDependency1:Tests#compile-pic-DummyTest.m.of01d5cbf,iphonesimulator-x86_64 failed with exit code 1:
objective-c-cpp-output compile
```


Tests for reference.

```objc
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
```
