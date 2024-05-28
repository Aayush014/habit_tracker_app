import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool click = true;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    click = preferences.getBool("theme") ?? true;
    notifyListeners();
  }

  Future<void> changeTheme() async {
    click = !click;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("theme", click);
    notifyListeners();
  }
}
