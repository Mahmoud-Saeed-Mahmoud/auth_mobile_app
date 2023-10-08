import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setUserName(String value) {
    return _sharedPreferences!.setString('userName', value);
  }

  String getUserName() {
    try {
      return _sharedPreferences!.getString('userName') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setEmail(String value) {
    return _sharedPreferences!.setString('email', value);
  }

  String getEmail() {
    try {
      return _sharedPreferences!.getString('email') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setGender(String value) {
    return _sharedPreferences!.setString('gender', value);
  }

  String getGender() {
    try {
      return _sharedPreferences!.getString('gender') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setRememberMe(bool value) {
    return _sharedPreferences!.setBool('rememberMe', value);
  }

  bool getRememberMe() {
    try {
      return _sharedPreferences!.getBool('rememberMe') ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clear() {
    return _sharedPreferences!.clear();
  }
}
