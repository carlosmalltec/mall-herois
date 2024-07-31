import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/components/styles/text_styles.dart';


class ErrorListData extends StatelessWidget {
  final String description;
  const ErrorListData({super.key, required this.description, });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error_outline_outlined,
          size: 30,
          color: ConstColors.redStronger,
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: TextStylesCustom.captionStrong(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
