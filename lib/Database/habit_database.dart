import 'package:flutter/material.dart';
import 'package:habit_tracker_app/Modal/app_settings.dart';
import 'package:habit_tracker_app/Modal/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;
  final List<Habit> currentHabits = [];

  // Initialize  db
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        HabitSchema,
        AppSettingsSchema,
      ],
      directory: dir.path,
    );
  }

  // Save first Date of App
  Future<void> saveFirstLaunchDate() async {
    final existingSetting = await isar.appSettings.where().findFirst();
    if (existingSetting == null) {
      final settings = AppSettings()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(
        () => isar.appSettings.put(settings),
      );
    }
  }

  // First Date of App Startup
  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }

  // Create new Habit
  Future<void> addHabit(String habitName) async {
    final newHabit = Habit()..name = habitName;
    await isar.writeTxn(
      () => isar.habits.put(newHabit),
    );
    readHabits();
  }

  Future<void> readHabits() async {
    List<Habit> fetchHabits = await isar.habits.where().findAll();
    currentHabits.clear();
    currentHabits.addAll(fetchHabits);
    notifyListeners();
  }

  // Check Habit On and Off
  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    final habit = await isar.habits.get(id);
    if (habit != null) {
      await isar.writeTxn(
        () async {
          if (isCompleted && !habit.completedDays.contains(DateTime.now())) {
            final today = DateTime.now();
            habit.completedDays.add(
              DateTime(
                today.year,
                today.month,
                today.day,
              ),
            );
          } else {
            habit.completedDays.removeWhere(
              (date) =>
                  date.year == DateTime.now().year &&
                  date.month == DateTime.now().month &&
                  date.day == DateTime.now().day,
            );
          }
          // Save the Updated Habit in db
          await isar.habits.put(habit);
        },
      );
    }
    readHabits();
  }
  // Update Habit
  Future<void> updateHabitName(int id, String newName) async{
    final habit = await isar.habits.get(id);
    if(habit != null){
      await isar.writeTxn(() async{
        habit.name = newName;
        await isar.habits.put(habit);
      },);
    }
    readHabits();
  }

  // Delete habit
  Future <void> deleteHabit (int id) async{
    await isar.writeTxn(() async{
      await isar.habits.delete(id);
    },);
    readHabits();
  }
}