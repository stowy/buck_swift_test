### To repro:

```
git clone git@github.com:stowy/buck_swift_test.git
git checkout origin/dependencyTests
buck build :MainBinary
```

### Bug description
- The problem is, building `:MainBinary`, when imported any headers from a MixedDependency, fails with header not found. 
- When not importing a header, even with the dependency still in place, it builds correctly
- To test, just clone this branch and run `buck build :MainBinary` and you should get the following error:

```
$ fbuck build :MainBinary
Not using buckd because watchman isn't installed.
MainApp/AppDelegate.m:5:9: fatal error: 'MixedDependency1/MixedDep1.h' file not found
#import "MixedDependency1/MixedDep1.h"
        ^
1 error generated.

BUILD FAILED: //:MainBinary#compile-AppDelegate.m.o4513ea3e,iphonesimulator-x86_64 failed with exit code 1:
objective-c compile_munge_debuginfo
[-] PROCESSING BUCK FILES...FINISHED 0.1s [100%] 🐳  New buck daemon
[-] DOWNLOADING... (0.00 B/S AVG, TOTAL: 0.00 B, 0 Artifacts)
[-] BUILDING...FINISHED 0.6s [100%] (11/13 JOBS, 0 UPDATED, 0 [0.0%] CACHE MISS)
```
- Note that if you remove the line `#import "MixedDependency1/MixedDep1.h"` from the AppDelegate in `MainApp/AppDelegate.m`, it will build successfully.
- Note also that the other apple_libraries with the same dependency (eg `:MixedDependency2`, `:MixedDependency3`) also build and run tests successfully, with dependencies
