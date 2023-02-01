import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/theme/custom_theme.dart';

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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

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
                style: textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                )
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            style: textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600,
            ),
            validator: validator,
            controller: controller,
            cursorColor: CustomTheme.primaryColor,
            maxLines: 1,
            keyboardType: TextInputType.text,
            obscureText: obscureText,
            readOnly: readOnly,
            onTap: onPressed,
            decoration: InputDecoration(
              border: getBorder(false),
              enabledBorder: getBorder(false),
              focusedBorder: getBorder(false),
              disabledBorder: getBorder(false),
              errorBorder: getBorder(true),
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 12,
              ),
              errorStyle: textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
              counterText: "",
              hintText: hintText,
              hintStyle: textTheme.headline6!.copyWith(
                color: CustomTheme.grey.shade200,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: Icon(
                suffixIcon,
                size: 26,
                color: CustomTheme.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder getBorder(bool isError) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: isError ? Colors.red : Colors.white),
    );
  }
}
