import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork {
  static late SharedPreferences sharedPref;
// set // get  // delete //clear (key. value )
  static Future cashInitalization() async {
    //hn3ml opject
    sharedPref = await SharedPreferences.getInstance(); // assignment
  }

  //1 Method --> set
  static Future<bool> SetToCache(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPref.setInt(key, value);
      return true;
    }

    if (value is String) {
      await sharedPref.setString(key, value);
      return true;
    }

    if (value is bool) {
      await sharedPref.setBool(key, value);
      return true;
    }

    if (value is double) {
      await sharedPref.setDouble(key, value);
      return true;
    }

    return false;
  }
//////////

  //2  Method  --> get

  static dynamic getCachData({required String key}) {
    return sharedPref.get(key); // get bt2bl key w b return lya value
  }
//////////
  //3  Method --> Delete

  static Future<bool> deleteCachItem({required String key}) async {
    return await sharedPref.remove(key);
  }
}
