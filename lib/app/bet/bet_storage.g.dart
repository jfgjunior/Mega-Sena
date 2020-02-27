// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_storage.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BetStorage on _BetStorageBase, Store {
  Computed<String> _$gameValueFormattedComputed;

  @override
  String get gameValueFormatted => (_$gameValueFormattedComputed ??=
          Computed<String>(() => super.gameValueFormatted))
      .value;
  Computed<bool> _$chooseAllNumbersComputed;

  @override
  bool get chooseAllNumbers => (_$chooseAllNumbersComputed ??=
          Computed<bool>(() => super.chooseAllNumbers))
      .value;

  final _$selectedNumbersAtom = Atom(name: '_BetStorageBase.selectedNumbers');

  @override
  ObservableList<int> get selectedNumbers {
    _$selectedNumbersAtom.context.enforceReadPolicy(_$selectedNumbersAtom);
    _$selectedNumbersAtom.reportObserved();
    return super.selectedNumbers;
  }

  @override
  set selectedNumbers(ObservableList<int> value) {
    _$selectedNumbersAtom.context.conditionallyRunInAction(() {
      super.selectedNumbers = value;
      _$selectedNumbersAtom.reportChanged();
    }, _$selectedNumbersAtom, name: '${_$selectedNumbersAtom.name}_set');
  }

  final _$quantityNumbersAtom = Atom(name: '_BetStorageBase.quantityNumbers');

  @override
  int get quantityNumbers {
    _$quantityNumbersAtom.context.enforceReadPolicy(_$quantityNumbersAtom);
    _$quantityNumbersAtom.reportObserved();
    return super.quantityNumbers;
  }

  @override
  set quantityNumbers(int value) {
    _$quantityNumbersAtom.context.conditionallyRunInAction(() {
      super.quantityNumbers = value;
      _$quantityNumbersAtom.reportChanged();
    }, _$quantityNumbersAtom, name: '${_$quantityNumbersAtom.name}_set');
  }

  final _$_BetStorageBaseActionController =
      ActionController(name: '_BetStorageBase');

  @override
  bool selectNumber(int number) {
    final _$actionInfo = _$_BetStorageBaseActionController.startAction();
    try {
      return super.selectNumber(number);
    } finally {
      _$_BetStorageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_BetStorageBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_BetStorageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_BetStorageBaseActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_BetStorageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'selectedNumbers: ${selectedNumbers.toString()},quantityNumbers: ${quantityNumbers.toString()},gameValueFormatted: ${gameValueFormatted.toString()},chooseAllNumbers: ${chooseAllNumbers.toString()}';
    return '{$string}';
  }
}
