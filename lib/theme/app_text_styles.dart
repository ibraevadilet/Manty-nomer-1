import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle s14W400({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s15W400({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s15W600({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
  static TextStyle s16W400({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s19W400({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 19,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s16W500({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle s18W700({Color? color}) => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s17W600({Color? color}) => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle s24W900({Color? color}) => TextStyle(
        fontSize: 24,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w900,
      );
  static TextStyle s28W900({Color? color}) => const TextStyle(
        fontSize: 28,
        color: Colors.black,
        fontWeight: FontWeight.w900,
      );
  static TextStyle s24W700({Color? color}) => TextStyle(
        fontSize: 24,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s20W700({Color? color}) => TextStyle(
        fontSize: 20,
        color: color ?? Colors.black,
        fontWeight: FontWeight.w700,
      );

  static const String fontFamily = 'Rubik';

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 45,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 35,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
  );
}
