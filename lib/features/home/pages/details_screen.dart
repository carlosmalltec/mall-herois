import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/components/styles/text_styles.dart';
import 'package:malltec_heroes/constants/const_pages.dart';
import 'package:malltec_heroes/services/heroes/data/models/heroes_model.dart';

import '../../../components/button/button_custom.dart';
import '../../../components/show_modal_bottom_sheet/bottom_sheet_app.dart';
import '../../../components/toast/toast.dart';
import '../../../services/heroes/data/models/request_model.dart';
import '../components/card_item_details.dart';
import '../components/content_modal_delete.dart';
import '../controllers/heroes_controllers.dart';

class DetailsScreen extends StatefulWidget {
  final HeroesControllers controller;
  final HeroesModel model;
  const DetailsScreen(
      {super.key, required this.model, required this.controller});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  HeroesModel get _model => widget.model;
  HeroesControllers get _controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.blueStrong,
        leading: InkWell(
          onTap: () => Modular.to.navigate(ConstPages.home),
          child: const Icon(
            Icons.arrow_back,
            color: ConstColors.grayLight,
          ),
        ),
        title: Text(
          _model.name,
          style: const TextStyle(
              color: ConstColors.blueWhite, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CardItemDetails(title: 'Herói', subtitle: _model.name),
            const SizedBox(
              height: 12,
            ),
            CardItemDetails(title: 'Categoria', subtitle: _model.category.name),
            const SizedBox(
              height: 12,
            ),
            CardItemDetails(
                title: 'Status', subtitle: _model.active ? "Ativo" : "Inativo"),
            const SizedBox(
              height: 40,
            ),
            ButtonCustom(
              onPressed: () => BottomSheetApp.customBottomSheet(
                context: context,
                content: ContentModalDelete(
                  model: _model,
                  onPressedDelete: () async => await onPressedDelete(),
                ),
              ),
              width: MediaQuery.sizeOf(context).width,
              colorBackground: ConstColors.grayLight,
              child: Text(
                'Deletar o Registro',
                style: TextStylesCustom.buttonWhite()
                    .copyWith(color: ConstColors.neutralStronger),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonCustom(
              onPressed: () => Modular.to
                  .navigate(ConstPages.updateHeroesPage, arguments: _model),
              width: MediaQuery.sizeOf(context).width,
              colorBackground: ConstColors.blueStrong,
              child: Text(
                'Editar o Registro',
                style: TextStylesCustom.buttonWhite(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressedDelete() async {
    final modelRequest = RequestModel(
      id: _model.id,
      active: _model.active,
      categoryId: _model.category.id,
      name: _model.name,
    );
    await _controller.deleteHeroes(
      modelRequest,
      onError: (error) {
        Toast.showToastWarning(title: "Oops!", description: error);
      },
      onSuccess: (error) {
        FocusManager.instance.primaryFocus?.unfocus();
        Toast.showToastSuccess(title: "Sucesso!", description: "Cadastro excluído!");
        Modular.to.navigate(ConstPages.home);
      },
    );
  }
}
