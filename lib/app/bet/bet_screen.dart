import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/bet/widgets/number_sheet.dart';
import 'package:flutter_lottery/app/bet/widgets/plus_less_selector.dart';
import 'package:flutter_lottery/app/common/states/cart_storage.dart';
import 'package:flutter_lottery/app/common/widgets/mega_button.dart';
import 'package:flutter_lottery/app/common/widgets/toolbar.dart';
import 'package:flutter_lottery/app/models/game.dart';
import 'package:flutter_lottery/res/routes.dart';
import 'package:flutter_lottery/res/strings.dart';
import 'package:flutter_lottery/res/styles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'bet_storage.dart';

class BetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar.getDefaultToolbar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child: _buildGameNumbers(),
          ),
          NumberSheet(),
          _buildBetInfo(context),
        ],
      ),
    );
  }

  Widget _buildGameNumbers() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.numberSelectionText,
            style: Styles.subtitleTextStyle,
          ),
          SizedBox(
            height: 8.0,
          ),
          PlusLessSelector(),
        ],
      );

  Widget _buildBetInfo(BuildContext context) {
    BetStorage storage = Provider.of<BetStorage>(context, listen: false);

    return Container(
      margin: EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    Strings.betValue,
                    style: Styles.subtitleTextStyle,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Observer(
                    builder: (_) => Text(
                        Provider.of<BetStorage>(context).gameValueFormatted,
                        style: Styles.valueText),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Observer(
                builder: (_) => Text(
                  Provider.of<BetStorage>(context).selectedNumbers.join(" - "),
                  style: Styles.primaryTextStyle
                      .copyWith(fontSize: 20.0, color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Center(
                child: Observer(
                  builder: (_) => MegaButton(
                    label: Strings.addToCart,
                    icon: Icons.shopping_cart,
                    onPressed: Provider.of<BetStorage>(context).chooseAllNumbers
                        ? () => Provider.of<CartStorage>(context, listen: false)
                            .saveGame(storage.game)
                        : null,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _goToCheckout(BuildContext context) {
    Navigator.pushNamed(context, Routes.checkout, arguments: []);
  }
}
