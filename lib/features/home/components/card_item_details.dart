import 'package:flutter/material.dart';

import '../../../components/styles/const_colors.dart';
import '../../../components/styles/text_styles.dart';

class CardItemDetails extends StatelessWidget {
  final String title, subtitle;
  const CardItemDetails(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(24),
      color: ConstColors.grayLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStylesCustom.h1Title()),
          Text(subtitle, style: TextStylesCustom.paragraphMdRegular()),
        ],
      ),
    );
  }
}
