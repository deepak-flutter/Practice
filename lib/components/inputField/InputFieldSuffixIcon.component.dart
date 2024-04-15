import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputFieldSuffixIconComponent extends StatelessWidget {
  const InputFieldSuffixIconComponent({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.inputController,
    this.icon,
    this.maxLength = 30,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.inputType,
    this.fontSize = 14,
    this.horizontalPadding = 15,
    this.verticalPadding = 10,
    this.fontWeight = FontWeight.w400,
    this.fillColor,
    this.borderColor,
    this.hintTextColor,
    this.borderRadius = 5,
  });

  final TextEditingController inputController;
  final String hintText;
  final bool isPassword;
  final IconData? icon;
  final int maxLength;
  final int maxLines;
  final bool readOnly;
  final Function? onTap;
  final TextInputType? inputType;
  final double fontSize;
  final FontWeight fontWeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? hintTextColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      controller: inputController,
      keyboardType: inputType ?? TextInputType.text,
      maxLength: maxLength,
      maxLines: maxLines,
      obscureText: isPassword,
      obscuringCharacter: "\u2732",
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText.tr,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: hintTextColor ?? context.theme.colorScheme.onSurfaceVariant,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: context.theme.colorScheme.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        suffixIcon: icon != null
            ? Icon(
                icon!,
                size: 16,
                color: context.theme.colorScheme.onSurfaceVariant,
              )
            : const SizedBox(
                width: 0,
              ),
        filled: true,
        fillColor: fillColor ?? context.theme.colorScheme.surfaceVariant,
      ),
      readOnly: readOnly,
      onTap: onTap != null ? () => onTap!() : () => {},
    );
  }
}
