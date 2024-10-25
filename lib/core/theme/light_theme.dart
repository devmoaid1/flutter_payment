import 'package:flutter/material.dart';
import 'package:flutter_payment/core/theme/app_colors.dart';
import 'package:flutter_payment/core/theme/text_theme.dart';

final ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    colorScheme: ColorScheme.fromSeed(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        error: AppColors.errorColor,
        shadow: AppColors.borderGray,
        outline: AppColors.darkGray,
        seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    textTheme: customTextTheme);
