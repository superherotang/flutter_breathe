import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 本地存储
class StorageService extends GetxService {
  StorageService._internal();
  static final StorageService _instance = StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    print("object");
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return prefs!.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? jsonString = prefs?.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return prefs!.setBool(key, val);
  }

  bool? getBool(String key) {
    return prefs!.getBool(key);
  }

  Future<bool> setString(String key, String value) async {
    return await prefs!.setString(key, value);
  }

  String getString(String key) {
    return prefs!.getString(key) ?? '';
  }

  Future<bool> remove(String key) {
    return prefs!.remove(key);
  }
}
