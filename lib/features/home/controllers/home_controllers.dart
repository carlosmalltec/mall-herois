import 'package:flutter/material.dart';
import 'package:malltec_heroes/services/heroes/data/models/heroes_model.dart';

import '../../../helpers/enums/type_states.dart';
import '../../../services/heroes/store/heroes_store.dart';
import '../../../services/type_failures/errors.dart';

class HomeControllers extends ChangeNotifier {
  final HeroesStore _heroesStore;

  HomeControllers({
    required HeroesStore heroesStore,
  }) : _heroesStore = heroesStore;

  TypeStates loadingStates = TypeStates.notLoading;
  setLoadingHeroes(TypeStates value) {
    loadingStates = value;
    notifyListeners();
  }

  String errorListData = '';
  setErrorListData(String error) {
    errorListData = error;
    notifyListeners();
  }

  List<HeroesModel> listHeroes = <HeroesModel>[];
  setHeroes(List<HeroesModel> data) {
    listHeroes
      ..clear()
      ..addAll(data);
    notifyListeners();
  }

  Future<void> getHeroes() async {
    checkRequestStorage();
    setLoadingHeroes(TypeStates.loading);
    final results = await _heroesStore.getHeroes();
    results.fold((l) {
      setLoadingHeroes(TypeStates.errorData);
      if (l is Errors) {
        setErrorListData((l).message.toString());
      }
      return;
    }, (r) {
      if (r != null && r.isNotEmpty) {
        setLoadingHeroes(TypeStates.notLoading);
        setHeroes(r);
        return;
      }
      setLoadingHeroes(TypeStates.notHasData);
      return;
    });
  }

  Future<void> checkRequestStorage() async {
    try {
      await _heroesStore.checkRequestStorage();
    } catch (e) {}
  }
}
