import '../Modal/habit.dart';

// Check if a habit is completed today
bool isHabitCompletedToday(List<DateTime> completedDays) {
  final DateTime today = DateTime.now();
  final DateTime todayDate = DateTime(today.year, today.month, today.day);

  return completedDays.any((date) =>
      date.year == todayDate.year &&
      date.month == todayDate.month &&
      date.day == todayDate.day);
}

// Prepare the heatmap dataset from the list of habits
Map<DateTime, int> prepHeatMapDataset(List<Habit> habits) {
  Map<DateTime, int> dataset = {};

  for (var habit in habits) {
    for (var date in habit.completedDays) {
      final DateTime normalizedDate = DateTime(date.year, date.month, date.day);

      if (dataset.containsKey(normalizedDate)) {
        dataset[normalizedDate] = dataset[normalizedDate]! + 1;
      } else {
        dataset[normalizedDate] = 1;
      }
    }
  }

  return dataset;
}
