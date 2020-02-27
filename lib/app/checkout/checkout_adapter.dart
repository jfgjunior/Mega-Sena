import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/common/states/cart_storage.dart';
import 'package:flutter_lottery/app/common/widgets/mega_button.dart';
import 'package:flutter_lottery/app/models/game.dart';
import 'package:flutter_lottery/res/strings.dart';
import 'package:flutter_lottery/res/styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutAdapter {
  final List<dynamic> elements;
  final BuildContext context;
  CheckoutAdapter({this.elements, this.context});

  int _getType(int position) {
    int lastPosition = elements.length - 1;
    var obj = elements[position];

    if (position == lastPosition) return BUY_BUTTON;
    if (obj is Game) return GAME_CARD;
    if (obj is String) return BET_TITLE;
    if (obj is double) return BET_TOTAL;

    throw Exception("Unknow type");
  }

  Widget createWidget(int position) {
    final int type = _getType(position);

    if (type == BET_TITLE) {
      return _buildBetTitle(elements[position]);
    }
    if (type == GAME_CARD) {
      return _buildCheckoutBet(elements[position]);
    }
    if (type == BET_TOTAL) {
      return _buildBetTotal(elements[position]);
    }

    return _buildBuyButton(elements[position]);
  }

  Widget _buildBetTitle(String title) => Text(
        title,
        style: Styles.primaryTextStyle.copyWith(fontSize: 25),
      );

  Widget _buildCheckoutBet(Game game) => Card(
        margin: EdgeInsets.only(
          top: 16.0,
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${Strings.draw}  ${game.gameNumber}",
                      style: Styles.subtitleTextStyle,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        Provider.of<CartStorage>(context, listen: false)
                            .removeGame(game),
                    icon: Icon(
                      Icons.close,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              Center(
                child: FittedBox(
                  child: Text(
                    game.formattedNumbers,
                    style: Styles.primaryTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text(
                      "${game.numbers.length} ${Strings.numbers}",
                      style: Styles.subtitleTextStyle,
                    ),
                  ),
                  Text(
                    game.price,
                    style: Styles.valueText.copyWith(fontSize: 18.0),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildBetTotal(double total) => Row(
        children: [
          Expanded(
            child: Text(
              Strings.total,
              style: Styles.subtitleTextStyle.copyWith(fontSize: 20.0),
            ),
          ),
          Text(
            NumberFormat.simpleCurrency(locale: "pt-BR", decimalDigits: 2)
                .format(total),
            style: Styles.primaryTextStyle.copyWith(fontSize: 25),
          ),
        ],
      );

  Widget _buildBuyButton(String label) => MegaButton(
        label: label,
        icon: Icons.check,
        onPressed: () {},
      );

  static const int BUY_BUTTON = 1001;
  static const int BET_TOTAL = 1002;
  static const int CHECKOUT_TITLE = 1003;
  static const int GAME_CARD = 1004;
  static const int BET_TITLE = 1005;
}
