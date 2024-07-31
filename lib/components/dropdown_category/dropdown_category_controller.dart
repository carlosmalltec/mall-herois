import 'package:flutter/material.dart';
import 'package:malltec_heroes/helpers/enums/type_states.dart';

import '../../services/categorys/data/models/category_model.dart';
import '../../services/categorys/store/category_store.dart';
import '../../services/type_failures/errors.dart';

class DropdownCategoryController extends ChangeNotifier {
  final CategoryStore _categoryStore;

  DropdownCategoryController({
    required CategoryStore categoryStore,
  }) : _categoryStore = categoryStore;

  TypeStates loadingStates = TypeStates.notLoading;
  setLoadingCategory(TypeStates p0) {
    loadingStates = p0;
    notifyListeners();
  }

  String errorListData = '';
  setErrorListData(String error) {
    errorListData = error;
    notifyListeners();
  }

  List<CategoryModel> listCategorys = <CategoryModel>[];
  setCategorys(List<CategoryModel> data) {
    listCategorys..clear()..addAll(data);
    notifyListeners();
  }

  List<CategoryModel> listCategorysSearch = <CategoryModel>[];
  setCategorysSearch(List<CategoryModel> data) {
    listCategorysSearch
      ..clear()
      ..addAll(data);
    notifyListeners();
  }

  Future<void> getCategory() async {
    setLoadingCategory(TypeStates.loading);
    final results = await _categoryStore.getCategorys();
    results.fold((l) {
      setLoadingCategory(TypeStates.errorData);
      if (l is Errors) {
        setErrorListData((l).message.toString());
      }
      return;
    }, (r) {
      if (r != null && r.isNotEmpty) {
        setLoadingCategory(TypeStates.notLoading);
        setCategorys(r);
        return;
      }
      setLoadingCategory(TypeStates.notHasData);
      return;
    });
  }

  searchCategoryList(String search) async {
    setLoadingCategory(TypeStates.searchLoading);
    List<CategoryModel> listSearch = listCategorys
        .where((CategoryModel p) =>
            p.name.toString().toLowerCase().contains(search.toLowerCase()))
        .toList();
    setCategorysSearch(listSearch);
  }
}
