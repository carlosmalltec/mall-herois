import 'package:flutter/material.dart';

import '../../services/categorys/data/models/category_model.dart';
import 'item_content_category.dart';

class ListViewSeparatedCategory extends StatelessWidget {
  final Function(dynamic dp0) onChangeValue;
  final List<CategoryModel> listData;
  
  const ListViewSeparatedCategory({
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
        CategoryModel list = listData[index];
        return InkWell(
          onTap: () {
            onChangeValue(list);
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.pop(context);
          },
          child: ItemContentCategory(
            title: list.name.toString(),
          ),
        );
      },
      separatorBuilder: (BuildContext c, int index) => const Divider(),
      itemCount: listData.length,
    );
  }
}