import 'package:flutter/material.dart';
import 'package:formula_one_calendar/shared_export.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  //APPBAR
  appBarTheme: AppBarTheme(
    backgroundColor: appColors.black,
    titleTextStyle: appTextStyle.getFormulaOne().copyWith(fontSize: 20),
  ),
  textTheme: TextTheme(
    titleSmall: appTextStyle.getQuicksand().copyWith(color: appColors.white),
    titleMedium: appTextStyle.getQuicksand().copyWith(color: appColors.white),
    titleLarge: appTextStyle.getQuicksand().copyWith(color: appColors.white),
  ),
  // //ELEVATED BUTTON
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     foregroundColor: Colors.white,
  //     backgroundColor: appColors.sand,
  //     // Text and icon color
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //   ),
  // ),
  // //TEXTBUTTON
  // textButtonTheme: TextButtonThemeData(
  //   style: TextButton.styleFrom(
  //     foregroundColor: appColors.white, // Text Color
  //   ),
  // ),
  // //DROPDOWN
  // canvasColor: appColors.sand,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: appColors.black),
  //SCAFFOLD
  scaffoldBackgroundColor: appColors.black,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  //APPBAR
  appBarTheme: AppBarTheme(
    backgroundColor: appColors.black,
  ),
  textTheme: TextTheme(
    titleLarge: appTextStyle.getQuicksand().copyWith(color: appColors.white),
  ),
  // //ELEVATED BUTTON
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     foregroundColor: Colors.white,
  //     backgroundColor: appColors.sandDark,
  //     // Text and icon color
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //   ),
  // ),
  // //TEXTBUTTON
  // textButtonTheme: TextButtonThemeData(
  //   style: TextButton.styleFrom(
  //     primary: Colors.deepPurple, // Text Color
  //   ),
  // ),
  // //DROPDOWN
  // canvasColor: appColors.sandDark,
  //SCAFFOLD
  scaffoldBackgroundColor: appColors.black,
);
