import 'package:duration__time__functions_class/duration__time__functions_class.dart'
    as duration__time__functions_class;

void main(List<String> arguments) {
  print("-------------------------");

  var dur = Duration(minutes: 61, seconds: 20);
  print(dur);

  print(dur.inMinutes);
  print(dur.inMinutes.remainder(60));

  print(dur.inSeconds);
  print(dur.inSeconds.remainder(60));

  print("-------------------------");

  var dur2 = Duration(minutes: 61, seconds: 67);
  print(dur2);

  print(dur2.inMinutes);
  print(dur2.inMinutes.remainder(60));

  print(dur2.inSeconds);
  print(dur2.inSeconds.remainder(60));

  print("-------------------------");

  var dur3 = Duration(minutes: 3, seconds: 30);
  print(dur3);

  print(dur3.inMinutes);
  print(dur3.inMinutes.remainder(60));

  print(dur3.inSeconds);
  print(dur3.inSeconds.remainder(60));

  // OUTPUT
  // 1:01:20.000000
  // 61
  // 1
  // 3680
  // 20
  // -------------------------
  // 1:02:07.000000
  // 62
  // 2
  // 3727
  // 7
  // -------------------------
  // 0:03:30.000000
  // 3
  // 3
  // 210
  // 30
}
