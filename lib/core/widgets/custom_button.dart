import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r), // Set the radius here
      ),
      color: context.appTheme.primaryColor,
      child: Text(
        text,
        style: context.appTextTheme.bodyLarge!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
