import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final flutterSharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  return CacheHelper.sharedPreferences;
});

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
