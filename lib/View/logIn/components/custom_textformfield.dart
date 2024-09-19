import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield({
    super.key,
    this.enabled = true,
    required this.labelText,
    required this.controller,
    this.borderColor = kTextWhite,
    this.curserColor = kTextWhite,
    this.borderRadius = 16,
    this.maxline = 1,
    this.isValid = true,
    this.obscureText = false,
    this.textcolor = kTextBlack,
    this.focusNode,
    this.textInputAction,
    this.suffixIcon,
    this.onFieldSubmitted,
  });
  final String labelText;
  final bool enabled;
  final TextEditingController controller;
  final Color borderColor;
  final Color curserColor;
  final double borderRadius;
  final int maxline;
  final Color textcolor;
  final bool isValid;
  final bool obscureText;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Function? onFieldSubmitted;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!(value);
        }
      },
      focusNode: focusNode,
      textInputAction: textInputAction,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: maxline,
      controller: controller,
      style: TextStyle(
        fontSize: 14.sp,
        fontFamily: defaultFount,
        fontWeight: FontWeight.w500,
        color: textcolor,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter Employee ID";
        } else if (value.contains(' ')) {
          return "Spaces are not allowed";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        // setState(() {
        //   if (value.isEmpty) {
        //     errorTextValue = 'This field cannot be empty';
        //   } else if (value.contains(' ')) {
        //     errorTextValue = 'Spaces are not allowed';
        //   } else {
        //     errorTextValue = '';
        //   }
        // });
      },

      //autofocus: false,
      //focusNode: node,
      cursorColor: curserColor,
      // cursorHeight: 52,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: labelText,
        // labelText: labelText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        labelStyle: TextStyle(
          fontSize: 14,
          fontFamily: defaultFount,
          fontWeight: FontWeight.w700,
          color: curserColor,
        ),
        focusColor: borderColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: ktextred)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        fillColor: Colors.transparent,
        errorText: isValid ? null : "Invalid $labelText",
      ),
    );
  }
}
