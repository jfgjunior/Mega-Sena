import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/common/states/cart_storage.dart';
import 'package:flutter_lottery/app/common/widgets/card_action.dart';
import 'package:flutter_lottery/res/Images.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:flutter_lottery/res/strings.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Toolbar {
  static Widget getDefaultToolbar(BuildContext context) => AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
          child: Image.asset(
            Images.caixaLogo,
          ),
        ),
        title: Text(
          Strings.appName,
          style: GoogleFonts.muli(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Observer(
            builder: (_) => CardAction(
              count: Provider.of<CartStorage>(context).gamesQuantity,
            ),
          )
        ],
      );
}
