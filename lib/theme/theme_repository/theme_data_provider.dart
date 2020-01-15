import 'dart:convert';

import 'package:flutter/services.dart';

class AppThemeDataProvider {
  Future<Map<String, dynamic>> readData() async {
    return Future.delayed(
      Duration(seconds: 1), // simulate API call
      () => rootBundle
          .loadString("assets/app_themes.json")
          .then((jsonString) => jsonDecode(jsonString)),
    );
  }
}
