import 'package:flutter/material.dart';
import 'package:habit_tracker_app/Database/habit_database.dart';
import 'package:habit_tracker_app/Pages/intro_page.dart';
import 'package:habit_tracker_app/Theme/Provider/theme_provider.dart';
import 'package:habit_tracker_app/Theme/dark_theme.dart';
import 'package:habit_tracker_app/Theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HabitDatabase.initialize();
  await HabitDatabase().getFirstLaunchDate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HabitDatabase(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: Provider.of<ThemeProvider>(context, listen: true).isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }
}
