import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../components/button/button_custom.dart';
import '../../../components/styles/const_colors.dart';
import '../../../components/styles/text_styles.dart';
import '../../../services/heroes/data/models/heroes_model.dart';

class ContentModalDelete extends StatelessWidget {
  final HeroesModel model;
  final dynamic Function()? onPressedDelete;
  const ContentModalDelete(
      {super.key, required this.model, this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Deseja deletar o registro?',
            style: TextStylesCustom.paragraphLgStrong(),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonCustom(
                onPressed: onPressedDelete,
                width: MediaQuery.sizeOf(context).width * .4,
                colorBackground: ConstColors.grayLight,
                child: Text(
                  'Deletar',
                  style: TextStylesCustom.buttonWhite()
                      .copyWith(color: ConstColors.neutralStronger),
                ),
              ),
              ButtonCustom(
                onPressed: () => Modular.to.pop(),
                width: MediaQuery.sizeOf(context).width * .4,
                colorBackground: ConstColors.blueStrong,
                child: Text(
                  'Cancelar',
                  style: TextStylesCustom.buttonWhite(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .1,
          ),
        ],
      ),
    );
  }
}
