import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.name,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.keyboardInputType,
    this.inputFormatters,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardInputType,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            decoration: TextDecoration.none,
          ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: hintText ?? '',
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.8),
              ),
          border: buildEnabledBorder(context),
          disabledBorder: buildEnabledBorder(context),
          focusedBorder: buildFocusedBorder(context),
          errorBorder: buildErrorBorder(context),
          enabledBorder: buildEnabledBorder(context),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.error,
              )),
      validator: validator,
      onChanged: onChanged ?? (value) {},
      onSaved: onSaved,
    );
  }

  OutlineInputBorder buildErrorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 1.3,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  OutlineInputBorder buildEnabledBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.shadow,
        width: 1.3,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  OutlineInputBorder buildFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 1.3,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }
}
