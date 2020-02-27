import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/checkout/checkout_adapter.dart';
import 'package:flutter_lottery/app/checkout/checkout_storage.dart';
import 'package:flutter_lottery/app/common/states/cart_storage.dart';
import 'package:flutter_lottery/app/common/widgets/toolbar.dart';
import 'package:flutter_lottery/app/models/game.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Game> games = Provider.of<CartStorage>(context).games;
    Provider.of<CheckoutStorage>(context).setGames(games);
    final CheckoutAdapter adapter = CheckoutAdapter(
        elements: Provider.of<CheckoutStorage>(context).getCheckoutList,
        context: context);

    return Scaffold(
      appBar: Toolbar.getDefaultToolbar(context),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Observer(
                builder: (context) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, position) =>
                        adapter.createWidget(position),
                    separatorBuilder: (_, __) => SizedBox(
                          height: 8.0,
                        ),
                    itemCount: Provider.of<CheckoutStorage>(context)
                        .getCheckoutList
                        .length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
