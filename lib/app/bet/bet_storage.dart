import 'dart:math';

import 'package:flutter_lottery/app/common/repositories/repository.dart';
import 'package:flutter_lottery/app/models/game.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'bet_storage.g.dart';

class BetStorage = _BetStorageBase with _$BetStorage;

abstract class _BetStorageBase with Store {
  static const int MAX_NUMBERS = 15;
  static const int MIN_NUMBERS = 6;

  final Repository repository;

  _BetStorageBase(this.repository);

  final Map<int, double> valueTable = {
    6: 4.5,
    7: 31.5,
    8: 126.0,
    9: 378.0,
    10: 945.0,
    11: 2079.0,
    12: 4158,
    13: 7722.0,
    14: 13513.5,
    15: 22522.5,
  };

  double gameValue(int numbers) => valueTable[numbers];

  Game get game => Game(
      value: valueTable[selectedNumbers.length],
      gameNumber: repository.gameNumber,
      numbers: selectedNumbers.toList());

  @observable
  ObservableList<int> selectedNumbers = ObservableList();

  @observable
  int quantityNumbers = MIN_NUMBERS;

  @computed
  String get gameValueFormatted =>
      NumberFormat.simpleCurrency(locale: "pt-BR", decimalDigits: 2)
          .format(gameValue(quantityNumbers));

  @computed
  bool get chooseAllNumbers => quantityNumbers == selectedNumbers.length;

  @action
  bool selectNumber(int number) {
    if (selectedNumbers.contains(number)) {
      selectedNumbers.remove(number);
      return false;
    } else if (selectedNumbers.length == quantityNumbers) {
      return false;
    }

    selectedNumbers.add(number);
    selectedNumbers.sort();
    return true;
  }

  @action
  void increment() {
    quantityNumbers = min(quantityNumbers + 1, MAX_NUMBERS);
  }

  @action
  void decrement() {
    quantityNumbers = max(quantityNumbers - 1, MIN_NUMBERS);
    if (selectedNumbers.length > quantityNumbers) {
      selectNumber(selectedNumbers.last);
    }
  }
}
