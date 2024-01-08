import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/theme/app_color_theme.dart';
import 'package:flutter_clean_architecture_template/core/theme/app_text_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType? textInputType;
  final double bottomPadding;
  final bool obscureText;
  final bool readOnly;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool isRequired;
  final VoidCallback? onPressed;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.bottomPadding = 16,
    this.obscureText = false,
    this.textInputType,
    this.readOnly = false,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.isRequired = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    final appColorTheme = Theme.of(context).extension<AppColorTheme>()!;

    return Container(
      margin: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: appTextTheme.label,
              ),
              if (isRequired)
                Text(
                  " *",
                  style: appTextTheme.label.copyWith(
                    color: appColorTheme.warning.shade500,
                  ),
                )
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            style: appTextTheme.formInput,
            validator: validator,
            controller: controller,
            cursorColor: appColorTheme.primary,
            maxLines: 1,
            keyboardType: TextInputType.text,
            obscureText: obscureText,
            readOnly: readOnly,
            onTap: onPressed,
            decoration: InputDecoration(
              border: getBorder(
                isError: false,
                colorTheme: appColorTheme,
              ),
              enabledBorder: getBorder(
                isError: false,
                colorTheme: appColorTheme,
              ),
              focusedBorder: getBorder(
                isError: false,
                colorTheme: appColorTheme,
              ),
              disabledBorder: getBorder(
                isError: false,
                colorTheme: appColorTheme,
              ),
              errorBorder: getBorder(
                isError: true,
                colorTheme: appColorTheme,
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 12,
              ),
              errorStyle: appTextTheme.formhelper.copyWith(
                color: appColorTheme.feedback,
              ),
              counterText: "",
              hintText: hintText,
              hintStyle: appTextTheme.formInput,
              suffixIcon: Icon(
                suffixIcon,
                size: 26,
                color: appColorTheme.gray.shade500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder getBorder({
    required bool isError,
    required AppColorTheme colorTheme,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: isError ? colorTheme.feedback : colorTheme.borderElement,
      ),
    );
  }
}
