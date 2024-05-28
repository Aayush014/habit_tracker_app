import 'package:flutter/material.dart';
import 'package:habit_tracker_app/Database/habit_database.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:habit_tracker_app/Pages/intro_page.dart';
import 'package:habit_tracker_app/Theme/Provider/theme_provider.dart';
import 'package:habit_tracker_app/Theme/dark_theme.dart';
import 'package:habit_tracker_app/Theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HabitDatabase.initialize();
  await HabitDatabase().getFirstLaunchDate();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool value = preferences.getBool("theme")?? false;
  runApp(
     MyApp(theme: value,),
  );
}

class MyApp extends StatelessWidget {
  bool theme;
  MyApp ({super.key, required this.theme});

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
        themeMode: Provider.of<ThemeProvider>(context, listen: true).click
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }
}
