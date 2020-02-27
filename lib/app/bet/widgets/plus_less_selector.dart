import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/bet/bet_storage.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:flutter_lottery/res/styles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PlusLessSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          _buildButton(
              icon: Icons.remove,
              action: Provider.of<BetStorage>(context).decrement),
          _buildNumberField(context),
          _buildButton(
              icon: Icons.add,
              action: Provider.of<BetStorage>(context).increment),
        ],
      );

  Widget _buildButton({IconData icon, Function action}) => Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
            border: Border.all(
          color: AppColors.buttonSecondColor,
          width: 1.0,
        )),
        child: GestureDetector(
          onTap: action,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      );

  Widget _buildNumberField(BuildContext context) => Container(
        width: 45.0,
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.buttonSecondColor,
              width: 1.0,
            ),
          ),
        ),
        child: Observer(
          builder: (_) => Center(
            child: Text(
              Provider.of<BetStorage>(context).quantityNumbers.toString(),
              style: Styles.subtitleTextStyle.copyWith(fontSize: 22.0),
            ),
          ),
        ),
      );
}
