import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/no_has_data/error_list_data.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/helpers/enums/type_states.dart';

import '../../helpers/debouncer/debouncer.dart';
import '../dropdown/title_dropdown_modal.dart';
import '../input/custom_input.dart';
import '../no_has_data/no_has_data.dart';
import '../shimmers/shimmer_search_modal.dart';
import './dropdown_category_controller.dart';
import './list_view_separated_category.dart';

class DropdownViewCategory extends StatefulWidget {
  final DropdownCategoryController controller;
  final Function(dynamic dp0) onChangeValue;
  const DropdownViewCategory({
    super.key,
    required this.onChangeValue,
    required this.controller,
  });

  @override
  State<DropdownViewCategory> createState() => _DropdownViewCategoryState();
}

class _DropdownViewCategoryState extends State<DropdownViewCategory> {
  DropdownCategoryController get _controller => widget.controller;
  Function(dynamic data) get _onChangeValue => widget.onChangeValue;
  final debouncer = Debouncer(milliseconds: 300);
  var controllerEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.getCategory();
      print('xxx ${_controller.listCategorys.length}');
    });
    super.initState();
  }

  searchCategory(String? name) {
    if (name != null && name != '') {
      _controller.setLoadingCategory(TypeStates.loading);
      debouncer.run(() => _controller.searchCategoryList(name));
    } else {
      _controller.setLoadingCategory(TypeStates.notLoading);
    }
  }

  @override
  void dispose() {
    controllerEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        child: Column(
          children: [
            const TitleDropdownModal(title: 'selecione a categoria'),
            const SizedBox(height: 20),
            CustomFormInput(
              controller: controllerEC,
              labelText: '',
              hintText: 'pesquisar',
              maxLength: 10,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              enabled: true,
              suffixIcon: const Icon(
                Icons.search,
                color: ConstColors.neutralStronger,
                size: 24,
              ),
              onChanged: (value) => searchCategory(value),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, Widget? widget) {
                if (_controller.loadingStates == TypeStates.loading) {
                  return const ShimmerSearch();
                }
                if (_controller.loadingStates == TypeStates.notHasData) {
                  return const Center(child: NotHasData());
                }
                if (_controller.loadingStates == TypeStates.errorData) {
                  return Center(
                      child: ErrorListData(
                    description: _controller.errorListData,
                  ));
                }
                if (_controller.loadingStates == TypeStates.searchLoading) {
                  return Expanded(
                    child: ListViewSeparatedCategory(
                        onChangeValue: _onChangeValue,
                        listData: _controller.listCategorysSearch),
                  );
                }
                return Expanded(
                  child: ListViewSeparatedCategory(
                      onChangeValue: _onChangeValue,
                      listData: _controller.listCategorys),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
