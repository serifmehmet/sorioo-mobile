import 'package:shared_preferences/shared_preferences.dart';

import 'package:sorioo/core/constants/preferences_keys.dart';

class CacheManager {
  CacheManager.init() {
    SharedPreferences.getInstance().then((value) => _preferences = value);
  }
  static final CacheManager _instance = CacheManager.init();
  SharedPreferences? _preferences;

  static CacheManager get instance => _instance;

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
    }
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> setIntValue(PreferencesKeys key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }

  Future<void> deleteStringValue(PreferencesKeys key) async {
    await _preferences!.remove(key.toString());
  }

  String getStringValue(PreferencesKeys key) => _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(PreferencesKeys key) => _preferences?.getBool(key.toString()) ?? false;

  int getIntValue(PreferencesKeys key) => _preferences?.getInt(key.toString()) ?? 0;
}
