// import 'package:collection1/collection1.dart' as collection1;
import 'dart:developer' as devtools show log;
import 'package:collection/collection.dart';

void main(List<String> arguments) {
  print('------------------');

  final fruits1 = {
    'name': ['orange', 'apple'],
    'quantity': 20,
  };

  final fruits2 = {
    'quantity': 20,
    'name': ['orange', 'apple'],
  };

  final fruits3 = {
    'quantity': 20,
    'name': ['apple', 'orange'],
  };

  print(fruits1.isEqualto(fruits2)); // true

  (fruits1.isEqualto(fruits2)).log(); // false
  print(fruits1 == fruits2); // true

  print('------------------');

  print(fruits3.isEqualto(fruits2)); // true

  (fruits3.isEqualto(fruits2)).log(); // false
  print(fruits3 == fruits2); // true

  print('------------------');
}

extension Log on Object {
  void log() => devtools.log(toString());
}

extension UnorderedEquality<K, V> on Map<K, V> {
  bool isEqualto(Map<K, V> other) {
    return DeepCollectionEquality.unordered().equals(this, other);
  }
}
