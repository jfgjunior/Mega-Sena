import 'package:intl/intl.dart';

class Game {
  final double value;
  final List<int> numbers;
  final int gameNumber;

  String get price =>
      NumberFormat.simpleCurrency(locale: "pt-BR", decimalDigits: 2)
          .format(value);

  String get formattedNumbers => numbers.join((" "));

  Game({this.value, this.numbers, this.gameNumber});
}
