import 'package:flutter/material.dart';

import '../../../helpers/enums/type_states.dart';
import '../../../services/heroes/data/models/request_model.dart';
import '../../../services/heroes/store/heroes_store.dart';
import '../../../services/type_failures/errors.dart';


class HeroesControllers extends ChangeNotifier {
  final HeroesStore _heroesStore;

  HeroesControllers({
    required HeroesStore heroesStore,
  }) : _heroesStore = heroesStore;

  TypeStates loadingStates = TypeStates.notLoading;
  setLoadingHeroes(TypeStates value) {
    loadingStates = value;
    notifyListeners();
  }

  Future<void> registerHeroes(
    RequestModel parameters, {
    Function(bool)? onSuccess,
    Function(String)? onError,
  }) async {
    setLoadingHeroes(TypeStates.loading);
    final results = await _heroesStore.registerHeroes(parameters);
    results.fold((l) {
      setLoadingHeroes(TypeStates.notLoading);
      if (l is Errors) {
        onError!((l).message.toString());
      }
    }, (r) {
      setLoadingHeroes(TypeStates.notLoading);
      onSuccess!(r);
    });
  }

  Future<void> updateHeroes(
    RequestModel parameters, {
    Function(bool)? onSuccess,
    Function(String)? onError,
  }) async {
    setLoadingHeroes(TypeStates.loading);
    final results = await _heroesStore.updateHeroes(parameters);
    results.fold((l) {
      setLoadingHeroes(TypeStates.notLoading);
      if (l is Errors) {
        onError!((l).message.toString());
      }
    }, (r) {
      setLoadingHeroes(TypeStates.notLoading);
      onSuccess!(r);
    });
  }
  Future<void> deleteHeroes(
    RequestModel parameters, {
    Function(bool)? onSuccess,
    Function(String)? onError,
  }) async {
    setLoadingHeroes(TypeStates.loading);
    final results = await _heroesStore.deleteHeroes(parameters);
    results.fold((l) {
      setLoadingHeroes(TypeStates.notLoading);
      if (l is Errors) {
        onError!((l).message.toString());
      }
    }, (r) {
      setLoadingHeroes(TypeStates.notLoading);
      onSuccess!(r);
    });
  }
}
