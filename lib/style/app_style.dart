import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData ligth = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: AppColor.base2,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.base2,
  ),
  fontFamily: "Manrope",
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize: const MaterialStatePropertyAll(Size.fromHeight(43)),
      backgroundColor: const MaterialStatePropertyAll(AppColor.primary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
      ),
    ),
  ),
  primaryColor: AppColor.primary,
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 19.spMin,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontSize: 15.spMin,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 14.spMin,
      fontWeight: FontWeight.w700,
    ),
    // Caption2
    bodySmall: TextStyle(
      fontSize: 11.spMin,
      fontWeight: FontWeight.w500,
      color: AppColor.text1,
    ),
  ),
);
