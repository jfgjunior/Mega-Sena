import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/common/widgets/luck_ball.dart';
import 'package:flutter_lottery/app/common/widgets/toolbar.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:flutter_lottery/res/routes.dart';
import 'package:flutter_lottery/res/strings.dart';
import 'package:flutter_lottery/res/styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: Toolbar.getDefaultToolbar(context),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              _buildResultTitle(),
              _buildResult(),
              _buildEstimations(),
              _buildBetButton(context),
            ],
          ),
        ),
      );

  Widget _buildResultTitle() => Container(
        margin: EdgeInsets.only(bottom: 28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              Strings.result,
              style: Styles.primaryTextStyle.copyWith(fontSize: 30),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              Strings.draw + " 2234", //TODO move to storage
              style: Styles.subtitleTextStyle,
            ),
          ],
        ),
      );

  Widget _buildResult() => Container(
        margin: EdgeInsets.only(bottom: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.accumulated, //TODO move to storage
              style: Styles.primaryTextStyle.copyWith(fontSize: 22.0),
            ),
            Wrap(
              // TODO move to storage, this values should come from the repo
              children: [
                4,
                21,
                27,
                29,
                42,
                47,
              ]
                  .map((number) => Container(
                        margin:
                            EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                        child: LuckBall(
                          number: number,
                          isEnabled: true,
                          mutable: false,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      );

  Widget _buildEstimations() => Container(
        margin: EdgeInsets.only(bottom: 38.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                Strings.estimationText,
                style: Styles.subtitleTextStyle,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              "R\$ 170.000.000",
              style: Styles.subtitleTextStyle.copyWith(fontSize: 30),
            )
          ],
        ),
      );

  Widget _buildBetButton(BuildContext context) => FlatButton.icon(
        onPressed: () => Navigator.pushNamed(context, Routes.bet),
        color: AppColors.buttonColor,
        icon: Icon(
          Icons.check,
          color: Colors.white,
        ),
        label: Text(
          Strings.betNow,
          style: Styles.subtitleTextStyle.copyWith(color: Colors.white),
        ),
      );
}
