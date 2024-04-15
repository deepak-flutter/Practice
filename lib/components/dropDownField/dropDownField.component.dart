// import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownFieldComponent extends StatelessWidget {
  const DropDownFieldComponent({
    super.key,
    required this.items,
    required this.onChanged,
    required this.dropdownValue,
    required this.hintText,
    required this.maxHeight,
    this.isGlobalFontApply = true,
    this.fillColor,
    this.borderColor,
    this.hintTextColor,
    this.borderRadius = 5,
    this.dropdownTextColor,
    this.horizontalPadding = 15,
    this.verticalPadding = 15,
    this.fontSize = 16,
    this.hintTextFontWeight = FontWeight.w400,
  });

  final List<String> items;
  final Function(String?) onChanged;
  final RxString dropdownValue;
  final String hintText;
  final double maxHeight;
  final bool isGlobalFontApply;
  final Color? fillColor;
  final Color? borderColor;
  final Color? hintTextColor;
  final Color? dropdownTextColor;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final FontWeight hintTextFontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          itemBuilder: (context, s, isSelected) {
            TextStyle textStyle = isGlobalFontApply
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: dropdownValue.value == s
                        ? context.theme.colorScheme.primary
                        : dropdownTextColor ??
                            context.theme.colorScheme.onSurfaceVariant,
                  )
                : TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: dropdownValue.value == s
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.onSurfaceVariant,
                    fontFamily: s,
                  );
            return ListTile(
              title: Obx(
                () => Text(
                  s.tr,
                  style: dropdownValue.value != "" ? textStyle : textStyle,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              selectedColor: context.theme.colorScheme.primary,
              selected: isSelected,
              visualDensity: VisualDensity.compact,
              dense: true,
            );
          },
          menuProps: MenuProps(
            backgroundColor:
                fillColor ?? context.theme.colorScheme.surfaceVariant,
          ),
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
        ),
        dropdownButtonProps: DropdownButtonProps(
          icon: const Icon(Icons.expand_more_rounded),
          iconSize: 16,
          color: borderColor ?? context.theme.colorScheme.onSurfaceVariant,
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
        ),
        items: items,
        onChanged: onChanged,
        selectedItem: dropdownValue.isEmpty ? null : dropdownValue.value,
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: context.theme.colorScheme.onPrimaryContainer,
          ),
          dropdownSearchDecoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: hintTextFontWeight,
              color:
                  hintTextColor ?? context.theme.colorScheme.onSurfaceVariant,
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            filled: true,
            fillColor: fillColor ?? context.theme.colorScheme.surfaceVariant,
            focusColor: context.theme.colorScheme.primary,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: borderColor ?? Colors.transparent),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(color: context.theme.colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
