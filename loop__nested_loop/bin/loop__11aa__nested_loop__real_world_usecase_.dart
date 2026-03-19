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

    if (day.contains(Exercise.pullUp) || day.contains(Exercise.pushUp)) {
      runAllExercises.add(Exercise.tenMinBreak);
    }
  }

  return runAllExercises;
}


// * Defines an `Exercise` enum representing workout activities like push-ups, pull-ups, running, break, and rest day.
// * Uses `typedef Entry = List<Exercise>` to represent one day’s workout plan.
// * In `main()`, creates three daily plans: Sunday, Monday, and Tuesday.
// * Combines them into `weeklyPlan`, a list of workout days.

// * Calls `runWeeklyPlan()` to process the weekly schedule.
// * The function loops through each day using a nested loop.
// * Each exercise is added to `runAllExercises`, flattening the structure.
// * If a day includes push-ups or pull-ups, a ten-minute break is added.
// * Returns the final flattened workout list.

// * Prints the completed execution plan.


// D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\loop__nested_loop\bin\loop__11aa__nested_loop__real_world_usecase_.dart
