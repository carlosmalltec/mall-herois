import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/components/styles/text_styles.dart';
import 'package:malltec_heroes/constants/const_pages.dart';
import 'package:malltec_heroes/helpers/enums/type_states.dart';

import '../../../components/button/button_custom.dart';
import '../../../components/dropdown/dropdown_field_bottom_sheet.dart';
import '../../../components/dropdown_category/dropdown_category.dart';
import '../../../components/dropdown_category/dropdown_category_controller.dart';
import '../../../components/input/custom_input.dart';
import '../../../components/toast/toast.dart';
import '../../../helpers/validators/validators.dart';
import '../../../services/categorys/data/models/category_model.dart';
import '../../../services/heroes/data/models/heroes_model.dart';
import '../../../services/heroes/data/models/request_model.dart';
import '../controllers/heroes_controllers.dart';

class UpdateHeroesScreen extends StatefulWidget {
  final HeroesModel model;
  final HeroesControllers controller;
  final DropdownCategoryController categoryController;
  const UpdateHeroesScreen(
      {super.key,
      required this.controller,
      required this.categoryController,
      required this.model});

  @override
  State<UpdateHeroesScreen> createState() => _UpdateHeroesScreenState();
}

class _UpdateHeroesScreenState extends State<UpdateHeroesScreen> {
  HeroesModel get _model => widget.model;
  RequestModel _requestModel = RequestModel();
  final _formKey = GlobalKey<FormState>();
  HeroesControllers get _controller => widget.controller;
  DropdownCategoryController get _categoryController =>
      widget.categoryController;
  final _categoryEC = TextEditingController();
  final _nomeEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_model.id != 0) {
        _nomeEC.text = _model.name;
        _categoryEC.text = _model.category.name;
        _requestModel = _requestModel.copyWith(
            id: _model.id, name: _model.name, categoryId: _model.category.id);
      }
    });
    super.initState();
  }

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
          'Atualizar os Dados',
          style: TextStyle(
              color: ConstColors.blueWhite, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomFormInput(
                controller: _nomeEC,
                labelText: 'Nome do Herói',
                hintText: 'Digite o nome Herói',
                maxLength: 50,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                enabled: true,
                validator: AppValidators.multiple([
                  AppValidators.required(),
                  AppValidators.min(5, m: "Digite nome completo do Herói"),
                ]),
                onSaved: (String? data) {
                  if (data != null) {
                    _requestModel = _requestModel.copyWith(name: data);
                  }
                },
              ),
              const SizedBox(height: 24),
              DropdownFieldBottomSheet(
                labelText: 'Categoria do Herói',
                hintText: 'Qual a Categoria do Herói?',
                controllerEC: _categoryEC,
                validator: AppValidators.required(),
                contentModal: DropdownViewCategory(
                  controller: _categoryController,
                  onChangeValue: (value) {
                    if (value != null) {
                      final data = (value as CategoryModel);
                      _requestModel =
                          _requestModel.copyWith(categoryId: data.id);
                      _categoryEC.text = data.name;
                    }
                  },
                ),
              ),
              const SizedBox(height: 24),
              AnimatedBuilder(
                  animation: _controller,
                  builder: (context, snapshot) {
                    return ButtonCustom(
                      isLoading:
                          _controller.loadingStates == TypeStates.loading,
                      onPressed: () async => await onPressed(),
                      width: MediaQuery.sizeOf(context).width,
                      colorBackground: ConstColors.blueStrong,
                      child: Text(
                        'Atualizar',
                        style: TextStylesCustom.buttonWhite(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  onPressed() async {
    var formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      _formKey.currentState?.save();
      _requestModel = _requestModel.copyWith(active: true);
      await _controller.updateHeroes(
        _requestModel,
        onError: (error) {
          Toast.showToastWarning(title: "Oops!", description: error);
        },
        onSuccess: (error) {
          FocusManager.instance.primaryFocus?.unfocus();
          Toast.showToastSuccess(
              title: "Sucesso!", description: "Alteração OK!");
          Modular.to.navigate(ConstPages.home);
        },
      );
    }
  }
}
