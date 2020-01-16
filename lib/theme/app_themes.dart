import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_themes.g.dart';

extension _BrightnesString on String {
  Brightness toBrightness() {
    switch (toLowerCase()) {
      case 'light':
        return Brightness.light;
      case 'dark':
        return Brightness.dark;
      default:
        throw Exception("Invalid theme brightness, expected light or dark");
    }
  }
}

extension _ColorString on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (this.length == 6 || this.length == 7) buffer.write('ff');
    buffer.write(this.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

@JsonSerializable(nullable: false)
class AppTheme {
  final String brightness;
  final String primaryColor;

  AppTheme({this.brightness, this.primaryColor});
  get themeData => ThemeData(
        brightness: brightness.toBrightness(),
        primaryColor: primaryColor.toColor(),
      );

  factory AppTheme.fromJson(Map<String, dynamic> json) =>
      _$AppThemeFromJson(json);
}
