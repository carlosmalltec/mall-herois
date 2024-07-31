import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/components/styles/text_styles.dart';
import 'package:malltec_heroes/features/home/controllers/home_controllers.dart';

import '../../../components/button/button_custom.dart';
import '../../../components/dropdown/dropdown_field_bottom_sheet.dart';
import '../../../components/dropdown_category/dropdown_category.dart';
import '../../../components/dropdown_category/dropdown_category_controller.dart';
import '../../../components/input/custom_input.dart';
import '../../../components/toast/toast.dart';
import '../../../helpers/validators/validators.dart';
import '../../../services/categorys/data/models/category_model.dart';

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
  final _nomeEC = TextEditingController();

  @override
  void dispose() {
    _categoryEC.dispose();
    _nomeEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.blueStrong,
        title: const Text(
          'Cadastro de Heroes',
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
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
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
            CustomFormInput(
              controller: _nomeEC,
              labelText: 'Nome do Héroe',
              hintText: 'Digite o nome Héroe',
              maxLength: 50,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              enabled: true,
              validator: AppValidators.multiple([
                AppValidators.required(),
                AppValidators.min(5, m: "Digite nome completo do Héroe"),
              ]),
              onSaved: (String? data) {
                if (data != null) {
                  // _dataRequest = _dataRequest.copyWith(zip: removeSpecialChars(data));
                }
              },
            ),
            const SizedBox(height: 24),
            DropdownFieldBottomSheet(
              labelText: 'Categoria do Héroe',
              hintText: 'Qual a Categoria do Héroe?',
              controllerEC: _categoryEC,
              validator: AppValidators.required(),
              contentModal: DropdownViewCategory(
                controller: _categoryController,
                onChangeValue: (value) {
                  if (value != null) {
                    final data = (value as CategoryModel);
                    print(data.toMap());
                  }
                  // var result = p0 as CityEntity;
                  // _countyEC.text = result.name ?? '';
                  // _dataRequest = _dataRequest.copyWith(city: result.name);
                },
              ),
            ),
            const SizedBox(height: 24),
            ButtonCustom(
              isLoading: false,
              onPressed: () {},
              width: MediaQuery.sizeOf(context).width,
              colorBackground: ConstColors.blueStrong,
              child: Text(
                'salvar',
                style: TextStylesCustom.buttonWhite(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
