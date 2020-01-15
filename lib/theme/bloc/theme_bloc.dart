import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dynamic_themed_app_flutter/theme/theme_repository.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final AppThemeRepository _appThemeRepository;
  ThemeBloc({@required AppThemeRepository appThemeRepository})
      : assert(appThemeRepository != null),
        _appThemeRepository = appThemeRepository;

  @override
  ThemeState get initialState => ThemeState(themeData: ThemeData.dark());

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: event.theme.themeData);
    } else if (event is LoadTheme) {
      var theme = await _appThemeRepository.getAppTheme(event.themeId);
      yield ThemeState(themeData: theme.themeData);
    }
  }
}
