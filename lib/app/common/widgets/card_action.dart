import 'package:flutter/material.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:flutter_lottery/res/routes.dart';

class CardAction extends StatelessWidget {
  final int count;

  String get _itemsCount => (count > 9) ? "+9" : "$count";

  CardAction({this.count});

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () => Navigator.pushNamed(context, Routes.checkout),
          ),
          Visibility(
            visible: count != 0,
            child: Container(
              margin: EdgeInsets.only(top: 4, right: 4),
              padding:
                  EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
              decoration: BoxDecoration(
                  color: AppColors.removeColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Text(
                _itemsCount,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      );
}
