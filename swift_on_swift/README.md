For `swift_library` depends on `swift_library`, run: `buck build :libparent`


For `apple_binary` depends on `swift_library`, run: `buck run :parent`


To test on iOS: run `buck install -r :ios-sos#iphonesimulator-x86_64`