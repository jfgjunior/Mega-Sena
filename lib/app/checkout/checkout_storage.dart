import 'package:flutter/animation.dart';
import 'package:flutter_lottery/app/models/game.dart';
import 'package:flutter_lottery/res/strings.dart';
import 'package:mobx/mobx.dart';

part 'checkout_storage.g.dart';

class CheckoutStorage = _CheckoutStorageBase with _$CheckoutStorage;

abstract class _CheckoutStorageBase with Store {
  @observable
  ObservableList<Game> games = ObservableList();

  @computed
  ObservableList<dynamic> get getCheckoutList => ObservableList()
    ..add(Strings.draws)
    ..addAll(games)
    ..add(_sumGamesValue())
    ..add(Strings.confirm);

  @action
  void setGames(List<Game> games) {
    this.games.addAll(games);
  }

  @action
  void removeGame(Game game) {
    if (games.isEmpty) return;

    games.remove(game);
  }

  double _sumGamesValue() {
    double sum = 0;
    games.forEach((game) => sum += game.value);
    return sum;
  }
}
