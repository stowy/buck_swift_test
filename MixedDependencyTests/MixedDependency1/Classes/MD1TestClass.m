#import "MD1TestClass.h"
#import "MixedDependency1-Swift.h"

@implementation MD1TestClass

+ (NSString *)answer {
  return NSStringFromClass([self class]);
}

+ (NSString *)fooBar {
  Foo *foo = [Foo new];
  return [foo bar];
}

+ (void)testSwift {
  [Test1 func1:@"Testing"];
}

@end
