import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker_app/Components/my_habit_tile.dart';
import 'package:habit_tracker_app/Database/habit_database.dart';
import 'package:habit_tracker_app/Modal/habit.dart';
import 'package:habit_tracker_app/Theme/Provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../Utils/habit_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var animationKey = UniqueKey();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HabitDatabase>(context, listen: false).readHabits();
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Create a new habit",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              String newHabitName = textController.text.trim();
              if (newHabitName.isNotEmpty) {
                context.read<HabitDatabase>().addHabit(newHabitName);
                Navigator.of(context).pop();
                textController.clear();
              }
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void checkHabitOnOff(bool? value, Habit habit) {
    if (value != null) {
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }
  }

  void editHabitBox(Habit habit) {
    textController.text = habit.name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Edit habit name",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              String newHabitName = textController.text.trim();
              if (newHabitName.isNotEmpty) {
                context.read<HabitDatabase>().updateHabitName(habit.id, newHabitName);
                Navigator.of(context).pop();
                textController.clear();
              }
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void deleteHabitBox(Habit habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure you want to delete?"),
        actions: [
          TextButton(
            onPressed: () {
              context.read<HabitDatabase>().deleteHabit(habit.id);
              Navigator.of(context).pop();
            },
            child: const Text("Delete"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          buildHeatMap(context),
          _buildHabitList(),
          const SizedBox(height: 100),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: myFloatingButton(context),
    );
  }

  Widget buildHeatMap(BuildContext context) {
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabits = habitDatabase.currentHabits;

    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.outline,
        ),
        child: HeatMap(
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 0)),
          datasets: prepHeatMapDataset(currentHabits),
          colorMode: ColorMode.color,
          defaultColor: Provider.of<ThemeProvider>(context).isDarkMode
              ? Colors.grey[800]
              : Colors.white,
          textColor: Provider.of<ThemeProvider>(context).isDarkMode
              ? Colors.white
              : Colors.black,
          fontSize: 15,
          showColorTip: false,
          showText: true,
          scrollable: true,
          size: 33,
          borderRadius: 10,
          colorsets: {
            1: Colors.blue.shade200,
            2: Colors.blue.shade300,
            3: Colors.blue.shade400,
            4: Colors.blue.shade500,
            5: Colors.blue.shade600,
          },
        ),
      ),
    );
  }

  Widget _buildHabitList() {
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabits = habitDatabase.currentHabits;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: currentHabits.length,
      itemBuilder: (context, index) {
        final habit = currentHabits[index];
        bool isCompletedToday = isHabitCompletedToday(habit.completedDays);

        return MyHabitTile(
          isCompleted: isCompletedToday,
          text: habit.name,
          onChanged: (value) => checkHabitOnOff(value, habit),
          editHabit: (context) => editHabitBox(habit),
          deleteHabit: (context) => deleteHabitBox(habit),
        );
      },
    );
  }

  Widget myFloatingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 38,
              width: 130,
              decoration: BoxDecoration(
                color: const Color(0xff007BFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: CupertinoButton(
                color: Colors.transparent,
                padding: EdgeInsets.zero,
                onPressed: createNewHabit,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text(" "),
                    Text(
                      "New Habit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            TweenAnimationBuilder(
              key: animationKey,
              tween: Tween<double>(begin: 10, end: 30),
              duration: const Duration(milliseconds: 400),
              builder: (context, sizeValue, child) => TweenAnimationBuilder(
                key: animationKey,
                tween: Tween<double>(begin: 1, end: 6),
                duration: const Duration(milliseconds: 400),
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: value,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        animationKey = UniqueKey();
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                      child: Icon(
                        (Provider.of<ThemeProvider>(context).isDarkMode)
                            ? CupertinoIcons.sun_max_fill
                            : CupertinoIcons.moon,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: sizeValue,
                      ),
                    ),
                  );
                },
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Icon(
                Icons.settings_outlined,
                color: Theme.of(context).colorScheme.secondary,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
