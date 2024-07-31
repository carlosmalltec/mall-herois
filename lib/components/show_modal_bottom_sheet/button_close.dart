import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.close_rounded,
            size: 20,
            color: ConstColors.neutralStronger,
          ),
        ),
      ],
    );
  }
}