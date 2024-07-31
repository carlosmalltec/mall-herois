import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/components/styles/text_styles.dart';

class NotHasData extends StatelessWidget {
  const NotHasData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error_outline,
          size: 30,
          color: ConstColors.neutralStronger,
        ),
        const SizedBox(height: 10),
        Text(
          'Resultado não encontrado.',
          style: TextStylesCustom.captionStrong(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
