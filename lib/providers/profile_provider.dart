import 'package:flutter/foundation.dart';
// import 'preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLight = true;
  bool get light => _isLight;
  static const preferencesKey = 'isLightTheme';

  void setLightTheme(bool theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(preferencesKey, theme);
    _isLight = theme;
    notifyListeners();
  }

  Future<bool> getLightTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(preferencesKey) ?? true;
  }

  void initProvider() async {
    bool theme = await getLightTheme();
    setLightTheme(theme);
  }
}
