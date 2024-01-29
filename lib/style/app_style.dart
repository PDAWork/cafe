import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData ligth = ThemeData(
  fontFamily: "Manrope",
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.fromHeight(43.h)),
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
      fontSize: 19.sp,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    ),
  ),
);
