apple_binary(
  name='MainBinary',
  headers= [
      'MainApp/AppDelegate.h'
  ],
  srcs = [
      'MainApp/AppDelegate.m',
      'MainApp/main.m',
      'MainApp/Test1.swift',
  ],
  deps = [
    '//objc_mix_swift1:dep1',
    '//swift_incremental:parent1',
    '//swift_on_objc:dep2',
    '//swift_on_swift:libparent',
    # '//modules_import:parent'
  ],
  frameworks = [
    '$SDKROOT/System/Library/Frameworks/UIKit.framework',
    '$SDKROOT/System/Library/Frameworks/Foundation.framework',
  ],
)

apple_bundle(
    name='MainBundle',
    binary=':MainBinary',
    extension='app',
    info_plist='MainApp/Info.plist',
    product_name = 'MainBundle',
    info_plist_substitutions={
        'PRODUCT_BUNDLE_IDENTIFIER': 'com.uber.test1',
        'EXECUTABLE_NAME': 'MainBundle'
    }
)
