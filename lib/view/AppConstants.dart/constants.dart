import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppColor {
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kLightBlue = Color.fromARGB(113, 64, 191, 255);
  static const Color kDarkBluePrimary = Color(0xFF223263);

  static const Color kLightGrey = Color(0xFF9098B1);
}

class AppSize {
  static SizedBox kSizedBox10h = SizedBox(height: 1.h);
  static SizedBox kSizedBox10w = SizedBox(width: 1.h);
}

class HeadTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final String fontFamily;
  const HeadTitle({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.bold,
    this.fontFamily = 'poppins',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color(0xD1020D4D),
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
    );
  }
}

final BorderRadius customBorderRadius4 = BorderRadius.circular(4.sp);

class CardText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? width;
  final Color color;
  final int? maxLines;
  final FontWeight fontWeight;

  const CardText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.width,
    this.color = AppColor.kDarkBluePrimary,
    this.maxLines = 2,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 28.w,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ));
  }
}

class LineThroughText extends StatelessWidget {
  String text;
  double fontSize;
  LineThroughText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.lineThrough,
          color: AppColor.kLightGrey,
          fontSize: fontSize,
        ));
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget icon;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final String? Function(String?)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.icon,
      this.obscureText = false,
      this.suffixIcon = const SizedBox(),
      this.keyboardType = TextInputType.multiline,
      required this.validator,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
          keyboardType: keyboardType,
          // keyboardType: keyboard,  
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          style: const TextStyle(height: 1),
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: AppColor.kLightGrey,
                // width: 0,
              )),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                width: 1,
              )),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.kLightGrey,
                  width: 0,
                ),
              ),
              labelText: label,
              labelStyle: TextStyle(
                color: AppColor.kLightGrey,
                fontSize: 12.sp,
              ),
              // hintText: 'Enter Your Mobile Number',
              hintStyle:
                  const TextStyle(fontSize: 12, color: AppColor.kLightGrey),
              prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: icon),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 24, minHeight: 24),
              suffixIcon: suffixIcon)),
    );
  }
}
