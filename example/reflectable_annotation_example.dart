import 'package:reflectable_annotation/reflectable_annotation.dart';
// IMPORTANT: @GlobalQuantifyMetaCapability must annotated on reflectable package import
@GlobalQuantifyCapability("^.HumanFriendly", reflected)
@GlobalQuantifyMetaCapability(MyAnnotation, reflected)
import 'package:reflectable/reflectable.dart';

import 'reflectable_annotation_example.reflectable.dart';

class MyAnnotation {
  const MyAnnotation();
}

abstract class HumanFriendly {}

class Animal {}

@MyAnnotation()
class Dog extends Animal implements HumanFriendly {}

main() {
  initializeReflectable();

  assert(reflected.canReflectType(Animal));
  assert(reflected.canReflectType(Dog));
  assert(reflected.canReflectType(HumanFriendly));

  ClassMirror dogClassMirror = reflected.reflectType(Dog);
  ClassMirror animalClassMirror = reflected.reflectType(Animal);
  ClassMirror humanFriendlyClassMirror = reflected.reflectType(HumanFriendly);

  assert(dogClassMirror.newInstance("", []) is Dog);
  assert(animalClassMirror.newInstance("", []) is Animal);
  assert(dogClassMirror.isSubclassOf(animalClassMirror));
  assert(dogClassMirror.isAssignableTo(animalClassMirror));
  assert(dogClassMirror.isAssignableTo(animalClassMirror));
  assert(dogClassMirror.isAssignableTo(humanFriendlyClassMirror));
}
