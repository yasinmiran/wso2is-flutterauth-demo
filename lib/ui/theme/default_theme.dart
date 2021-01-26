/// Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
///
/// WSO2 Inc. licenses this file to you under the Apache License,
/// Version 2.0 (the "License"); you may not use this file except
/// in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing,
/// software distributed under the License is distributed on an
/// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
/// KIND, either express or implied. See the License for the
/// specific language governing permissions and limitations
/// under the License.
import 'package:flutter/material.dart';
import 'package:flutterauth/ui/theme/default_text_theme.dart';

import 'app_colors.dart';

final ThemeData wso2DefaultTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.white,
  secondaryHeaderColor: AppColors.grey.withOpacity(0.4),
  accentColor: AppColors.wso2,
  appBarTheme: AppBarTheme(
    color: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.dimGrey),
    textTheme: defaultTextTheme,
  ),
  textTheme: defaultTextTheme,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.wso2,
    foregroundColor: AppColors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 50,
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.wso2,
    unselectedItemColor: AppColors.dimGrey,
    selectedIconTheme: IconThemeData(color: AppColors.wso2),
    unselectedIconTheme: IconThemeData(color: AppColors.dimGrey),
  ),
  cardColor: AppColors.white,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  sliderTheme: SliderThemeData(
    activeTickMarkColor: AppColors.wso2,
    activeTrackColor: AppColors.honeyYellow,
  ),
  scaffoldBackgroundColor: AppColors.white,
  iconTheme: IconThemeData(color: AppColors.dimGrey),
  colorScheme: ColorScheme(
    primary: AppColors.wso2,
    primaryVariant: AppColors.honeyYellow,
    secondary: AppColors.minionYellow,
    secondaryVariant: AppColors.white,
    surface: AppColors.lightGrey,
    background: AppColors.darkGrey,
    error: AppColors.orangeRedCrayola,
    onPrimary: AppColors.white,
    onSecondary: AppColors.black,
    onSurface: AppColors.black,
    onBackground: AppColors.black,
    onError: AppColors.white,
    brightness: Brightness.light,
  ),
  bottomAppBarColor: AppColors.transparent,
  bottomAppBarTheme: BottomAppBarTheme(
    color: AppColors.transparent,
    elevation: 0,
  ),
);

final InputDecoration inputDecoration = InputDecoration(
  focusColor: AppColors.dimGrey,
  prefixStyle: bodyText2.copyWith(color: AppColors.dimGrey),
  suffixStyle: bodyText2.copyWith(color: AppColors.dimGrey),
  helperStyle: bodyText2.copyWith(color: AppColors.dimGrey),
  hintStyle: bodyText2.copyWith(color: AppColors.dimGrey),
  labelStyle: bodyText1.copyWith(color: AppColors.dimGrey),
  errorStyle: bodyText2.copyWith(
    color: AppColors.orangeRedCrayola,
    fontWeight: FontWeight.bold,
  ),
  fillColor: AppColors.grey.withOpacity(0.1),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.dimGrey,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.orangeRedCrayola,
      style: BorderStyle.solid,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.grey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.dimGrey,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.orangeRedCrayola,
    ),
  ),
);
