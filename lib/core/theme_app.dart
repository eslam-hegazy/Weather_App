import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app_color.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryIconTheme: const IconThemeData(
      color: AppColor.kWhite,
    ),
    iconTheme: const IconThemeData(
      color: AppColor.kWhite,
    ),
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColor.kWhite,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColor.kWhite,
      ),
      backgroundColor: AppColor.kBlack,
      titleTextStyle: TextStyle(
        color: AppColor.kWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: AppColor.kWhite,
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(
      color: AppColor.kBlack,
    ),
    primaryIconTheme: const IconThemeData(
      color: AppColor.kBlack,
    ),
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColor.kBlack,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColor.kBlack,
      ),
      backgroundColor: AppColor.kBlack,
      titleTextStyle: TextStyle(
        color: AppColor.kBlack,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: AppColor.kBlack,
      ),
    ),
  );
}
