import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final FormFieldSetter<String>? onSaved;

  const CustomTextField({
    super.key,
    required this.name,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            decoration: TextDecoration.none,
          ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.8),
            ),
        errorBorder: buildErrorBorder(context),
        enabledBorder: buildEnabledBorder(context),
      ),
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
}
