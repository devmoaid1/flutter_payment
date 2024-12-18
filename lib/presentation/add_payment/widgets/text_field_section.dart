import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  final String title;
  final String name;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  const TextFieldSection(
      {super.key,
      required this.title,
      required this.name,
      required this.hintText,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.keyboardInputType,
      this.inputFormatters,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: context.appTextTheme.bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
      ),
      15.h.vSpace,
      CustomTextField(
        name: name,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardInputType: keyboardInputType,
        hintText: hintText,
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    ]);
  }
}
