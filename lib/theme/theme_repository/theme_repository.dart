import 'package:dynamic_themed_app_flutter/theme/theme_repository/theme_data_provider.dart';

import '../app_themes.dart';

class AppThemeRepository {
  final appThemeDataProvider = AppThemeDataProvider();

  Future<AppTheme> getAppTheme(String id) async {
    return appThemeDataProvider
        .readData()
        .then((appThemeJson) => AppTheme.fromJson(appThemeJson[id]));
  }
}
