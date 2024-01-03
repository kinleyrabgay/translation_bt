import 'package:shared_preferences/shared_preferences.dart';
import 'package:translation_bt/core/constants/constants.dart';
import 'package:translation_bt/core/errors/exceptions.dart';

abstract class SplasherLocalDataSource {
  const SplasherLocalDataSource();

  Future<void> cacheFirstTimer();
  Future<bool> checkFirstTimer();
}

class SplasherLocalDataSourceImplementation extends SplasherLocalDataSource {
  const SplasherLocalDataSourceImplementation(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _prefs.setBool(kFirstTimerKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkFirstTimer() async {
    try {
      return _prefs.getBool(kFirstTimerKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
