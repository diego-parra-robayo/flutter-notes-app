import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextFormFieldValidationProps validationProps;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.validationProps,
    this.obscureText = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: validationProps.controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      autovalidateMode: validationProps.autoValidateMode,
      validator: validationProps.validator,
    );
  }
}

class TextFormFieldValidationProps {
  late final TextEditingController controller;
  final AutovalidateMode autoValidateMode;
  late final String? Function(String? value)? validator;

  TextFormFieldValidationProps({
    TextEditingController? controller,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    String? Function(String input)? validator,
  }) {
    this.controller = controller ?? TextEditingController();
    this.validator = (input) {
      if (validator != null) return validator(input ?? '');
      return null;
    };
  }
}

extension TextFormFieldValidationMapX<T extends Enum>
    on Map<T, TextFormFieldValidationProps> {
  void disposeAllControllers() {
    for (final props in values) {
      props.controller.dispose();
    }
  }

  bool isValid() {
    for (final props in values) {
      if (props.validator != null &&
          props.validator!(props.controller.text) != null) {
        return false;
      }
    }
    return true;
  }

  void reset() {
    for(final props in values) {
      props.controller.text = '';
    }
  }

  String? getText(T key) => this[key]?.controller.text;
}
