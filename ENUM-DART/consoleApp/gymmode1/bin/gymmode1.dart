import 'package:gymmode1/gymmode1.dart' as gymmode1;

// void main(List<String> arguments) {
//   print('Hello world: ${gymmode1.calculate()}!');
// }


import 'dart:async';

// practice base on wger flutter gym_mode.dart UI 

enum SlotType {
  exerciseOverview,
  log,
  timer,
}

class SlotPage {
  final SlotType slotType;
  final int? restTime;

  SlotPage({required this.slotType, this.restTime});
}

List<String> getContent(List<List<SlotPage>> pages, {int defaultRest = 60}) {
  final List<String> out = ['StartPage'];

  for (final page in pages) {
    for (final slot in page) {
      if (slot.slotType == SlotType.exerciseOverview) {
        out.add('ExerciseOverview');
      } else if (slot.slotType == SlotType.log) {
        out.add('LogPage');
      } else if (slot.slotType == SlotType.timer) {
        final rest = slot.restTime ?? defaultRest;
        out.add('TimerCountdownWidget(${rest}s)');
      }
    }
  }

  out.addAll(['SessionPage', 'WorkoutSummary']);
  return out;
}

Future<void> main() async {
  print('=== 1. PAGES ===');
  final List<List<SlotPage>> slots = [
    [
      SlotPage(slotType: SlotType.exerciseOverview),
      SlotPage(slotType: SlotType.log),
      SlotPage(slotType: SlotType.timer, restTime: 90),
    ]
  ];
  print('Generated Pages: ${getContent(slots)}\n');


}