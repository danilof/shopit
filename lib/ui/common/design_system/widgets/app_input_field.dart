import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/styles.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final String? errorText;
  final String? helperText;
  final String? confirmationText;
  final String? initialValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  final bool autofocus;
  final bool isTappable;
  final bool showLabel;
  final dynamic validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onFieldTapped;
  final void Function()? trailingTapped;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  AppInputField(
      {super.key,
      required this.controller,
      this.focusNode,
      this.placeholder = '',
      this.leading,
      this.trailing,
      this.password = false,
      this.errorText,
      this.helperText,
      this.confirmationText,
      this.initialValue,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.enabled = true,
      this.autofocus = false,
      this.isTappable = false,
      this.showLabel = false,
      this.trailingTapped,
      this.onFieldSubmitted,
      this.onChanged,
      this.validator,
      this.onFieldTapped,
      this.inputFormatters});

  AppInputField.tappable(
      {super.key,
      this.controller,
      this.focusNode,
      this.placeholder = '',
      this.leading,
      this.trailing,
      this.password = false,
      this.errorText,
      this.helperText,
      this.confirmationText,
      this.initialValue,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.enabled = true,
      this.autofocus = false,
      this.isTappable = true,
      this.showLabel = true,
      this.trailingTapped,
      this.onFieldSubmitted,
      this.onChanged,
      required this.onFieldTapped,
      this.validator,
      this.inputFormatters});

  AppInputField.multiline(
      {super.key,
      required this.controller,
      this.focusNode,
      this.placeholder = '',
      this.leading,
      this.trailing,
      this.password = false,
      this.errorText,
      this.helperText,
      this.confirmationText,
      this.initialValue,
      this.keyboardType = TextInputType.multiline,
      this.textInputAction = TextInputAction.next,
      this.enabled = true,
      this.autofocus = false,
      this.isTappable = false,
      this.showLabel = true,
      this.trailingTapped,
      this.onFieldSubmitted,
      this.onChanged,
      this.onFieldTapped,
      this.validator,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return isTappable && enabled
        ? InkWell(
            onTap: onFieldTapped,
            child: IgnorePointer(child: getAppFormField()))
        : getAppFormField();
  }

  Widget getAppFormField() {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: TextStyle(height: 1, color: enabled ? null : kcMediumGreyColor),
      maxLines: (keyboardType == TextInputType.multiline) ? 5 : 1,
      textInputAction: textInputAction,
      enabled: enabled,
      validator: validator,
      obscureText: password,
      initialValue: initialValue,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: kcPrimaryColor,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: placeholder,
        labelStyle: bodyStyle,
        hintText: placeholder,
        hintStyle: bodyStyle,
        errorText: errorText,
        floatingLabelBehavior: showLabel
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        helperText: (confirmationText != null) ? confirmationText : helperText,
        helperStyle: TextStyle(
            color: (confirmationText != null) ? Colors.green : Colors.orange),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: enabled ? false : false,
        //fillColor: kcVeryLightGreyColor,

        prefixIcon: leading,
        suffixIcon: trailing != null && enabled
            ? GestureDetector(
                onTap: trailingTapped,
                child: trailing,
              )
            : null,
        border: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcLightGreyColor),
        ),
        //helperText: "bravo",
        errorBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcPrimaryColor),
        ),
        disabledBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: kcMediumGreyColor),
        ),
        enabledBorder: circularBorder.copyWith(
          borderSide: BorderSide(
              color:
                  (confirmationText != null) ? Colors.green : kcLightGreyColor),
        ),

        // filled: true,
        // fillColor: kcVeryLightGreyColor,
      ),
    );
  }
}
