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
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColor.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w700,
        ),
      ),
      fixedSize: const MaterialStatePropertyAll(Size.fromHeight(43)),
      backgroundColor: const MaterialStatePropertyAll(AppColor.primary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.r),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: TextStyle(
      fontSize: 13.spMin,
      fontWeight: FontWeight.w400,
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 13.h,
      horizontal: 16.w,
    ),
    constraints: const BoxConstraints(minHeight: 44),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.primary),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.primary),
      borderRadius: BorderRadius.circular(8),
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
    // Callout
    labelMedium: TextStyle(
      fontSize: 13.spMin,
      fontWeight: FontWeight.w400,
    ),
  ),
);
