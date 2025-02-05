import 'package:clean_note_app/core/data/local/shared_preferences/flutter_shared_preferences.dart';
import 'package:clean_note_app/core/data/local/shared_preferences/ishared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferencesImpl>((ref) {
  final sharedPreferences = ref.watch(flutterSharedPreferencesProvider);

  return SharedPreferencesImpl(sharedPreferences);
});

class SharedPreferencesImpl implements ISharedPreferences {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesImpl(this._sharedPreferences);

  @override
  String? getData(String key) {
    try {
      return _sharedPreferences.getString(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeData(String key) async {
    try {
      return await _sharedPreferences.remove(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> setData(String key, String value) async {
    try {
      return await _sharedPreferences.setString(key, value);
    } catch (e) {
      rethrow;
    }
  }
}
