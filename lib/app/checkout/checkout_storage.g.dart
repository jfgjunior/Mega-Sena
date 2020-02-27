// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_storage.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckoutStorage on _CheckoutStorageBase, Store {
  Computed<ObservableList<dynamic>> _$getCheckoutListComputed;

  @override
  ObservableList<dynamic> get getCheckoutList => (_$getCheckoutListComputed ??=
          Computed<ObservableList<dynamic>>(() => super.getCheckoutList))
      .value;

  final _$gamesAtom = Atom(name: '_CheckoutStorageBase.games');

  @override
  ObservableList<Game> get games {
    _$gamesAtom.context.enforceReadPolicy(_$gamesAtom);
    _$gamesAtom.reportObserved();
    return super.games;
  }

  @override
  set games(ObservableList<Game> value) {
    _$gamesAtom.context.conditionallyRunInAction(() {
      super.games = value;
      _$gamesAtom.reportChanged();
    }, _$gamesAtom, name: '${_$gamesAtom.name}_set');
  }

  final _$_CheckoutStorageBaseActionController =
      ActionController(name: '_CheckoutStorageBase');

  @override
  void setGames(List<Game> games) {
    final _$actionInfo = _$_CheckoutStorageBaseActionController.startAction();
    try {
      return super.setGames(games);
    } finally {
      _$_CheckoutStorageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeGame(Game game) {
    final _$actionInfo = _$_CheckoutStorageBaseActionController.startAction();
    try {
      return super.removeGame(game);
    } finally {
      _$_CheckoutStorageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'games: ${games.toString()},getCheckoutList: ${getCheckoutList.toString()}';
    return '{$string}';
  }
}
