import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';

import '../styles/text_styles.dart';

class TitleDropdownModal extends StatelessWidget {
  final String title;
  const TitleDropdownModal({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStylesCustom.captionRegular().copyWith(
        color: ConstColors.neutralStronger,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}