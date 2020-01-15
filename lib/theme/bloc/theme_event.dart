import 'package:dynamic_themed_app_flutter/theme/app_themes.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({@required this.theme});

  @override
  List<Object> get props => [theme];
}

class LoadTheme extends ThemeEvent {
  final String themeId;

  LoadTheme({this.themeId});

  @override
  List<Object> get props => [themeId];
}
