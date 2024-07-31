import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';

import '../../../components/styles/text_styles.dart';


class ItemListContent extends StatelessWidget {
  final String title;
  final bool trailing;
    final void Function()? onTap;

  const ItemListContent({
    super.key,
    required this.title,
     this.trailing = true, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      title: Text(
        title,
        style: TextStylesCustom.captionRegular().copyWith(
          color: ConstColors.neutralStronger,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: Visibility(
        visible: trailing,
        child: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: ConstColors.neutralStronger,
          size: 18,
        ),
      ),
    );
  }
}