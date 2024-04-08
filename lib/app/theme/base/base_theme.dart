import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Base Theme (Shared Properties)
abstract class BaseTheme {

  BaseTheme({
    this.brightness = Brightness.light,
    this.scaffoldBackgroundColor,
  });

  final Brightness brightness;

  Color get primaryColor ;
  Color get focusedInputBorderColor => const Color(0xEE9898A9);
  Color get inputBorderColor => const Color(0xEED9D9DE);
  Color get secondaryColor ;
  final Color? scaffoldBackgroundColor;

  TextStyle get headline6 => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: brightness == Brightness.light ? Colors.black : Colors.white,
  );

  TextStyle get bodyText1 => TextStyle(
    fontSize: 16.sp,
    color: brightness == Brightness.light ? Colors.black : Colors.white,
  );

  TextStyle get button => TextStyle(
    fontSize: 18.sp,
    color: brightness == Brightness.light ? Colors.white : Colors.black,
  );

  ColorScheme get colorScheme;

  ProgressIndicatorThemeData get progressIndicatorThemeData;

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      primaryColor: Colors.white,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: inputBorderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: Colors.red,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: focusedInputBorderColor,
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.black, fontSize: 24.sp),
        bodyMedium: TextStyle(color: Colors.grey[700]),
        labelLarge: const TextStyle(color: Colors.white),
      ),
      typography: Typography.material2021(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      progressIndicatorTheme: progressIndicatorThemeData,
    );
  }
}
