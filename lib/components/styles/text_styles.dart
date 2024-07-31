import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';

class TextStylesCustom {
  TextStylesCustom._();

  static TextStyle buttonWhite({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.5,
      color: ConstColors.blueWhite,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle h1Title({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 1.40,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle paragraphLgStrong({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.41,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle paragraphMdRegular({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      height: 1.33,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle paragraphMdStrong({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.33,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle captionStrong({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.54,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle captionRegular({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      height: 1.54,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle h3({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 17,
      height: 1.25,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle h2({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.33,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle heading({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      height: 1.54,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle label({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.54,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle medium({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      height: 1.50,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle buttonMedium({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      height: 1.60,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle pageTitle({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 23,
      height: 1.30,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle circularNotification({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 7,
      height: 1.20,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }

  static TextStyle mobileBoldMedium({TextStyle? secondStyle}) {
    TextStyle p0 = const TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 13,
      height: 1.50,
      color: ConstColors.neutralStronger,
    );
    return secondStyle != null ? p0.merge(secondStyle) : p0;
  }
}
