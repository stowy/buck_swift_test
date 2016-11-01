### Test app to test buck build stability

- Install buck from master at HEAD
- Ensure watchman is installed
- Check out this repo, on the branch 'test' 
- Run the following commands:
  - `buck build :MainBundle`
  - `buck test swift_test:TestBundle`
  - `buck build :MainBundle`
  - `buck test swift_test:TestBundle`

- This should result in a failure:

```
[-] PROCESSING BUCK FILES...FINISHED 0.4s
[+] DOWNLOADING... (0.00 B/S, TOTAL: 0.00 B, 0 Artifacts)
[+] BUILDING...0.0s
[2016-11-01 13:37:22.432][error][command:null][tid:150][com.facebook.buck.cli.Main] Uncaught exception at top level
java.lang.StackOverflowError
	at sun.reflect.generics.parser.SignatureParser.parsePackageNameAndSimpleClassTypeSignature(SignatureParser.java:328)
	at sun.reflect.generics.parser.SignatureParser.parseClassTypeSignature(SignatureParser.java:310)
	at sun.reflect.generics.parser.SignatureParser.parseFieldTypeSignature(SignatureParser.java:289)
	at sun.reflect.generics.parser.SignatureParser.parseFieldTypeSignature(SignatureParser.java:283)
	at sun.reflect.generics.parser.SignatureParser.parseTypeArgument(SignatureParser.java:436)
	at sun.reflect.generics.parser.SignatureParser.parseTypeArguments(SignatureParser.java:399)
	at sun.reflect.generics.parser.SignatureParser.parsePackageNameAndSimpleClassTypeSignature(SignatureParser.java:346)
	at sun.reflect.generics.parser.SignatureParser.parseClassTypeSignature(SignatureParser.java:310)
	at sun.reflect.generics.parser.SignatureParser.parseFieldTypeSignature(SignatureParser.java:289)
	at sun.reflect.generics.parser.SignatureParser.parseFieldTypeSignature(SignatureParser.java:283)
	at sun.reflect.generics.parser.SignatureParser.parseTypeSignature(SignatureParser.java:485)
	at sun.reflect.generics.parser.SignatureParser.parseTypeSig(SignatureParser.java:188)
	at sun.reflect.generics.repository.FieldRepository.parse(FieldRepository.java:52)
	at sun.reflect.generics.repository.FieldRepository.parse(FieldRepository.java:42)
	at sun.reflect.generics.repository.AbstractRepository.<init>(AbstractRepository.java:74)
	at sun.reflect.generics.repository.FieldRepository.<init>(FieldRepository.java:48)
	at sun.reflect.generics.repository.FieldRepository.make(FieldRepository.java:66)
	at java.lang.reflect.Field.getGenericInfo(Field.java:105)
	at java.lang.reflect.Field.getGenericType(Field.java:247)
	at com.facebook.buck.rules.ParamInfo.<init>(ParamInfo.java:87)
	at com.facebook.buck.rules.TargetNodeFactory.create(TargetNodeFactory.java:83)
	at com.facebook.buck.rules.TargetNodeFactory.copyNodeWithFlavors(TargetNodeFactory.java:178)
	at com.facebook.buck.rules.TargetNode.withFlavors(TargetNode.java:196)
	at com.facebook.buck.rules.TargetGraph.getInternal(TargetGraph.java:87)
	at com.facebook.buck.rules.TargetGraph.get(TargetGraph.java:97)
	at com.facebook.buck.rules.BuildRuleResolver.requireRule(BuildRuleResolver.java:135)
	at com.facebook.buck.rules.BuildRuleResolver.requireAllRules(BuildRuleResolver.java:152)
	at com.facebook.buck.rules.DefaultTargetNodeToBuildRuleTransformer.transform(DefaultTargetNodeToBuildRuleTransformer.java:44)
	at com.facebook.buck.rules.BuildRuleResolver.requireRule(BuildRuleResolver.java:136)
	at com.facebook.buck.rules.BuildRuleResolver.requireAllRules(BuildRuleResolver.java:152)
	at com.facebook.buck.rules.DefaultTargetNodeToBuildRuleTransformer.transform(DefaultTargetNodeToBuildRuleTransformer.java:44)
	at com.facebook.buck.rules.BuildRuleResolver.requireRule(BuildRuleResolver.java:136)
	at com.facebook.buck.rules.BuildRuleResolver.requireAllRules(BuildRuleResolver.java:152)
	at com.facebook.buck.rules.DefaultTargetNodeToBuildRuleTransformer.transform(DefaultTargetNodeToBuildRuleTransformer.java:44)
	at com.facebook.buck.rules.BuildRuleResolver.requireRule(BuildRuleResolver.java:136)
	at com.facebook.buck.rules.BuildRuleResolver.requireAllRules(BuildRuleResolver.java:152)
	at com.facebook.buck.rules.DefaultTargetNodeToBuildRuleTransformer.transform(DefaultTargetNodeToBuildRuleTransformer.java:44)
```
