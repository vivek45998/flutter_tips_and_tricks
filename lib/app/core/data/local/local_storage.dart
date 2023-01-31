import 'package:get_storage/get_storage.dart';

class LocalStorageData{

  static const String keyIsLoggedIn = 'isLoggedIn';
  static const String keyUserData = 'userData';
  static const String keyUserId = 'userId';
  static final _localStorageBox = GetStorage();

  static void clearStorage() {
   _localStorageBox.erase();
  }

  static void removeStorage(key) {
    _localStorageBox.remove(key);
  }

  static void saveData(String key, var value) {
   _localStorageBox.write(key, value);
  }

  static dynamic getData(String key) {
    return _localStorageBox.read(key);
  }
}