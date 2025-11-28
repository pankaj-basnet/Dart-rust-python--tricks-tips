import 'package:class_cluster/class_cluster.dart' as class_cluster;

import 'dart:developer' as devtools show log;

void main(List<String> arguments) {
  var son = Father.fromGender(Gender.son);
  (son.ht()).log();
  print(son.ht());

  print('-------');

  var daughter = Father.fromGender(Gender.daughter);
  (daughter.ht()).log();
  print(daughter.ht());
}

enum Gender { son, daughter }

extension Log on Object {
  void log() => devtools.log(toString());
}

// @immutable
abstract class Father {
  const Father();
  factory Father.fromGender(Gender gender) {
    switch (gender) {
      case Gender.son:
        return Son();
      case Gender.daughter:
        return Daughter();
    }
  }

  double ht();
}

// @immutable
class Son extends Father {
  const Son();

  @override
  double ht() => 0.85 * 165;
}

// @immutable
class Daughter extends Father {
  const Daughter();

  @override
  double ht() => 0.8 * 165;
}
