import 'package:reflectable/capability.dart';
import 'package:reflectable/reflectable.dart';

class Reflected extends Reflectable {
  const Reflected()
      : super(
          typingCapability,
          invokingCapability,
          superclassQuantifyCapability,
          subtypeQuantifyCapability,
          typeAnnotationQuantifyCapability,
          reflectedTypeCapability,
        );
}

const reflected = Reflected();
