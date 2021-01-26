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
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
/// https://api.flutter.dev/flutter/material/TextTheme-class.html

///  NAME         SIZE  WEIGHT  SPACING             CASE
///  =======================================================
///  headline1    96.0  light   -1.5                Sentence
///  headline2    60.0  light   -0.5                Sentence
///  headline3    48.0  regular  0.0                Sentence
///  headline4    34.0  regular  0.25               Sentence
///  headline5    24.0  regular  0.0                Sentence
///  headline6    20.0  medium   0.15               Sentence
///  subtitle1    16.0  regular  0.15               Sentence
///  subtitle2    14.0  medium   0.1                Sentence
///  body1        16.0  regular  0.5   (bodyText1)  Sentence
///  body2        14.0  regular  0.25  (bodyText2)  Sentence
///  button       14.0  medium   1.25               All Caps
///  caption      12.0  regular  0.4                Sentence
///  overline     10.0  regular  1.5                All Caps

/// WEIGHT        VALUE
/// ===================================
/// Bold          w700
/// Normal        w400 (Regular, Plain)
/// Thin          w100
/// Extra-Light   w200
/// Light         w300
/// Medium        w500
/// Semi-Bold     w600
/// Extra-Bold    w800
/// Black         w900

final TextStyle headline1 = GoogleFonts.lato(
  fontSize: 96.0,
  fontWeight: FontWeight.w300,
  letterSpacing: -1.5,
);

final TextStyle headline2 = GoogleFonts.lato(
  fontSize: 60.0,
  fontWeight: FontWeight.w300,
  letterSpacing: -.5,
);

final TextStyle headline3 = GoogleFonts.lato(
  fontSize: 48.0,
  fontWeight: FontWeight.normal,
  letterSpacing: 0,
);

final TextStyle headline4 = GoogleFonts.lato(
  fontSize: 34.0,
  fontWeight: FontWeight.normal,
  letterSpacing: .25,
);

final TextStyle headline5 = GoogleFonts.lato(
  fontSize: 24.0,
  fontWeight: FontWeight.normal,
);

final TextStyle headline6 = GoogleFonts.lato(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  letterSpacing: .15,
);

final TextStyle subtitle1 = GoogleFonts.lato(
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  letterSpacing: .15,
);

final TextStyle subtitle2 = GoogleFonts.lato(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  letterSpacing: .1,
);

final TextStyle bodyText1 = GoogleFonts.lato(
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  letterSpacing: .5,
);

final TextStyle bodyText2 = GoogleFonts.lato(
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  letterSpacing: .25,
);

final TextStyle button = GoogleFonts.lato(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.25,
);

final TextStyle caption = GoogleFonts.lato(
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  letterSpacing: .4,
);

final TextStyle overLine = GoogleFonts.lato(
  fontSize: 10.0,
  fontWeight: FontWeight.normal,
  letterSpacing: 1.5,
);

final TextTheme defaultTextTheme = TextTheme(
  headline1: headline1.copyWith(color: AppColors.darkGrey),
  headline2: headline2.copyWith(color: AppColors.darkGrey),
  headline3: headline3.copyWith(color: AppColors.darkGrey),
  headline4: headline4.copyWith(color: AppColors.darkGrey),
  headline5: headline5.copyWith(color: AppColors.darkGrey),
  headline6: headline6.copyWith(color: AppColors.darkGrey),
  subtitle1: subtitle1.copyWith(color: AppColors.darkGrey),
  subtitle2: subtitle2.copyWith(color: AppColors.darkGrey),
  bodyText1: bodyText1.copyWith(color: AppColors.darkGrey),
  bodyText2: bodyText2.copyWith(color: AppColors.darkGrey),
  button: button.copyWith(color: AppColors.darkGrey),
  caption: caption.copyWith(color: AppColors.darkGrey),
  overline: overLine.copyWith(color: AppColors.darkGrey),
);
