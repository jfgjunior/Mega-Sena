// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_storage.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStorage on _CartStorageBase, Store {
  Computed<int> _$gamesQuantityComputed;

  @override
  int get gamesQuantity =>
      (_$gamesQuantityComputed ??= Computed<int>(() => super.gamesQuantity))
          .value;

  final _$gamesAtom = Atom(name: '_CartStorageBase.games');

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

  final _$_CartStorageBaseActionController =
      ActionController(name: '_CartStorageBase');

  @override
  void saveGame(Game game) {
    final _$actionInfo = _$_CartStorageBaseActionController.startAction();
    try {
      return super.saveGame(game);
    } finally {
      _$_CartStorageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeGame(Game game) {
    final _$actionInfo = _$_CartStorageBaseActionController.startAction();
    try {
      return super.removeGame(game);
    } finally {
      _$_CartStorageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'games: ${games.toString()},gamesQuantity: ${gamesQuantity.toString()}';
    return '{$string}';
  }
}
