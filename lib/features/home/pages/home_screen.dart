import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/features/home/controllers/home_controllers.dart';

import '../../../components/dropdown/dropdown_field_bottom_sheet.dart';
import '../../../components/dropdown_category/dropdown_category.dart';
import '../../../components/dropdown_category/dropdown_category_controller.dart';
import '../../../components/toast/toast.dart';
import '../../../helpers/validators/validators.dart';

class HomeScreen extends StatefulWidget {
  final HomeControllers controller;
  final DropdownCategoryController categoryController;
  const HomeScreen(
      {super.key, required this.controller, required this.categoryController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeControllers get _controllers => widget.controller;
  DropdownCategoryController get _categoryController =>
      widget.categoryController;
  final _categoryEC = TextEditingController();

  @override
  void dispose() {
    _categoryEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.blueStrong,
        title: const Text(
          'Heroes',
          style: TextStyle(
              color: ConstColors.blueWhite, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_outlined,
              color: ConstColors.blueWhite,
              size: 35,
            ),
            tooltip: 'novo cadastro',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () => Toast.showToastWarning(
                  title: "Oops!",
                  description: "Não identificamos seu dados de acesso!"),
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            DropdownFieldBottomSheet(
              labelText: 'categoria',
              hintText: 'selecione a categoria',
              controllerEC: _categoryEC,
              validator: AppValidators.required(),
              contentModal: DropdownViewCategory(
                controller: _categoryController,
                onChangeValue: (value) {
                  print(value);
                  // var result = p0 as CityEntity;
                  // _countyEC.text = result.name ?? '';
                  // _dataRequest = _dataRequest.copyWith(city: result.name);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
