import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/constants/const_pages.dart';

import '../../../services/heroes/data/models/heroes_model.dart';
import 'item_list_content.dart';

class ListViewSeparatedHeroes extends StatelessWidget {
  final Function(dynamic dp0) onChangeValue;
  final List<HeroesModel> listData;

  const ListViewSeparatedHeroes({
    super.key,
    required this.onChangeValue,
    required this.listData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext c, int index) {
        HeroesModel list = listData[index];
        return InkWell(
          onTap: () {
            Modular.to.navigate(ConstPages.detailsHeroesPage, arguments: list);
          },
          child: ItemListContent(
            title: list.name.toString(),
          ),
        );
      },
      separatorBuilder: (BuildContext c, int index) => const Divider(),
      itemCount: listData.length,
    );
  }
}
