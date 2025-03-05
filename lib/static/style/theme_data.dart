import 'package:flutter/material.dart';
import 'package:newsify/static/style/typography.dart';
import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: green,
  scaffoldBackgroundColor: whiteColor,
  appBarTheme: AppBarTheme(
    color: green,
    iconTheme: IconThemeData(color: whiteColor),
  ),
  textTheme: TextTheme(
    bodyMedium: regularTextStyle.copyWith(color: blackColor),
    headlineMedium: titleTextStyle.copyWith(color: blackColor),
  ),
  cardTheme: CardTheme(
    color: whiteColor,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: coolGreen,
  scaffoldBackgroundColor: darkBackground,
  appBarTheme: AppBarTheme(
    color: darkCardColor,
    iconTheme: IconThemeData(color: whiteColor),
  ),
  textTheme: TextTheme(
    bodyMedium: regularTextStyle.copyWith(color: darkTextColor),
    headlineSmall: titleTextStyle.copyWith(color: darkTextColor),
  ),
  cardTheme: CardTheme(
    color: darkCardColor,
    elevation: 2,
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);
