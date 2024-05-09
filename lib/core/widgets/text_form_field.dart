// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/validate.dart';
import 'package:flutter/material.dart';
import 'package:cars/core/consts/style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.perfixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.perfixText = '',
    this.controller,
    this.border,
    this.validator,
    this.autoFocus = false,
    this.focusNode,
  }) : super(key: key);
  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool obscureText;
  final Widget? perfixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final int maxLines;
  final String perfixText;
  final TextEditingController? controller;
  final OutlineInputBorder? border;
  final String? Function(String?)? validator;
  final bool autoFocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: hint == StringsEn.noHandPhone || hint == StringsEn.phone
          ? TextInputType.number
          : TextInputType.text,
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: obscureText,
      autofocus: autoFocus,
      cursorColor: AppConsts.mainColor,
      controller: controller,
      focusNode: focusNode,
      validator: validator ??
          (value) {
            if (hint == StringsEn.email && !isEmailValid(value)) {
              return StringsEn.enterValidEmail;
            } else if (hint == StringsEn.password && !isPasswordValid(value)) {
              return StringsEn.warningPass;
            } else if (hint == StringsEn.confirmNewPass &&
                !isPasswordValid(value)) {
              return StringsEn.passwordNotMatch;
            } else if (hint == StringsEn.phoneNumber &&value!.length<11) {
              return StringsEn.phoneNumberMustBe;
            } else if (value!.isEmpty) {
              return StringsEn.fieldRequired;
            }
            return null;
          },
      onFieldSubmitted: onSaved,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).canvasColor,
          ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).canvasColor.withOpacity(.05),
        hintText: hint,
        hintStyle: AppConsts.styleHint14,
        prefixIcon: perfixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: border ??
            AppConsts.normalBorderField.copyWith(
                //borderRadius: BorderRadius.circular(19),
                ),
        focusedBorder: border ??
            AppConsts.normalBorderField.copyWith(
              //borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppConsts.mainColor.withOpacity(.4),
              ),
            ),
        focusedErrorBorder: border ??
            AppConsts.normalBorderField.copyWith(
              borderRadius: BorderRadius.circular(10),
            ),
        errorBorder: AppConsts.errorBorderField,
      ),
    );
  }
}
