Duration calculateDuration(DateTime startTime, DateTime endTime) {
  // If the endTime occurs "chronologically" before startTime, it means it has crossed midnight.
  // We can automatically handle this by checking if the end time is before the start time.
  if (endTime.isBefore(startTime)) {
    // Add 24 hours (1 day) to the end time to get the correct duration.
    endTime = endTime.add(const Duration(days: 1));
  }
  
  return endTime.difference(startTime);
}

void main() {
  // Example: 9:00 PM (21:00) yesterday to 6:30 AM today
  DateTime start = DateTime(2026, 6, 18, 21, 0); 
  DateTime end = DateTime(2026, 6, 19, 6, 30);  

  Duration duration = calculateDuration(start, end);

  print('Hours: ${duration.inHours}');
  print('Minutes: ${duration.inMinutes.remainder(60)}');
}
