// import 'package:collection1/collection1.dart' as collection1;
import 'dart:developer' as devtools show log;

void main(List<String> arguments) {
}


extension Log on Object {
  void log() => devtools.log(toString());
}


extension UnorderedEquality<K, V> on Map<K, V> {

  // bool isEqualto 

}