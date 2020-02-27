import 'package:flutter/cupertino.dart';
import 'package:flutter_lottery/app/models/game.dart';
import 'package:mobx/mobx.dart';
part 'cart_storage.g.dart';

class CartStorage = _CartStorageBase with _$CartStorage;

abstract class _CartStorageBase with Store {
  @observable
  ObservableList<Game> games = ObservableList();

  @computed
  int get gamesQuantity => games.length;

  @action
  void saveGame(Game game) => games.add(game);

  @action
  void removeGame(Game game) => games.remove(game);
}
