void main(List<String> arguments) {
  Entry sunday = [Exercise.pullUp, Exercise.pushUp];
  Entry monday = [Exercise.running];
  Entry tuesday = [Exercise.restDay];

  List<Entry> weeklyPlan = [sunday, monday, tuesday];

  print("\n=== Weekly Workout Execution Plan ===");

  List<Exercise> finalRunningList = runWeeklyPlan(weeklyPlan);

  print("\n=== Final Flattened Plan ===");
  for (final exercise in finalRunningList) {
    print(exercise);
  }
}

enum Exercise { pushUp, pullUp, running, tenMinBreak, restDay }

typedef Entry = List<Exercise>;

List<Exercise> runWeeklyPlan(List<Entry> weeklyPlan) {
  List<Exercise> runAllExercises = [];
  for (final day in weeklyPlan) {
    for (final exercise in day) {
      runAllExercises.add(exercise);
    }

    if (day.contains(Exercise.pullUp)) {
      runAllExercises.add(Exercise.tenMinBreak);
    }
  }

  return runAllExercises;
}

// D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\loop__nested_loop\bin\loop__11aa__nested_loop__real_world_usecase_.dart
